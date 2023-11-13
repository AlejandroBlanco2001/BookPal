import 'package:bookpal/app/pages/authentication/signup_page.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/company/remote_bloc/remote_company_bloc.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:bookpal/presentation/storage_bucket/bloc/bucket_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BlocBuilder<RemoteCompanyBloc, RemoteCompanyState>(
                    builder: (context, companyState) {
                      if (companyState is RemoteCompanyLoaded) {
                        context.read<BucketBloc>().add(GetDownloadUrl(
                            '$companiesLogosPath${companyState.company!.logo}'));
                      }
                      return BlocBuilder<BucketBloc, BucketState>(
                        builder: (context, bucketState) {
                          if (bucketState is GotCompanyDownloadUrl) {
                            return Image.network(
                              bucketState.downloadUrl!,
                              fit: BoxFit.fitHeight,
                            );
                          } else if (bucketState is DownloadUrlLoading) {
                            switch (defaultTargetPlatform) {
                              case TargetPlatform.android:
                                return const CircularProgressIndicator();
                              case TargetPlatform.iOS:
                                return const CupertinoActivityIndicator();
                              default:
                                return const CircularProgressIndicator();
                            }
                          } else {
                            return const Icon(Icons.error_outline);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              Text(
                "Welcome back",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Log in to your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 60),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return TextFormField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onEditingComplete: () => _focusNodePassword.requestFocus(),
                    validator: (String? value) {
                      if (state.statusCode != null && state.statusCode == 401) {
                        return "Incorrect email or password";
                      }
                      if (value == null || value.isEmpty) {
                        return "Please introduce your email";
                      } else if (!Utilities.validateEmail(value)) {
                        return "Invalid email";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return TextFormField(
                    controller: _controllerPassword,
                    focusNode: _focusNodePassword,
                    obscureText: _obscurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: _obscurePassword
                              ? const Icon(Icons.visibility_outlined)
                              : const Icon(Icons.visibility_off_outlined)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (String? value) {
                      if (state.statusCode != null && state.statusCode == 401) {
                        return "Incorrect email or password";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            context.read<LoginBloc>().add(
                                  Login(
                                    _controllerEmail.text,
                                    _controllerPassword.text,
                                  ),
                                );
                            if (state is LoginSuccess) context.read<NavigationBloc>().add(ToHomePage());
                          }
                        },
                        child: (state is LoginInitial || state is LoginError)
                            ? const Text("Log In")
                            : (state is LoginLoading)
                                ? (defaultTargetPlatform ==
                                        TargetPlatform.android)
                                    ? const CircularProgressIndicator()
                                    : const CupertinoActivityIndicator()
                                : const Text("Log In"),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          _formKey.currentState?.reset();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const SignupPage();
                              },
                            ),
                          );
                        },
                        child: const Text("Signup"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}
