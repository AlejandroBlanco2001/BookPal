import 'package:bookpal/app/widgets/loading/platform_activity_indicator.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/user_model.dart';
import 'package:bookpal/presentation/company/remote_bloc/remote_company_bloc.dart';
import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final List<String> _programs = [
    'Computer Science',
    'Politics',
    'Economics',
    'Business Administration',
    'Law',
    'Medicine',
    'Psychology',
  ];

  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeSecondName = FocusNode();
  final FocusNode _focusNodeLastName = FocusNode();
  final FocusNode _focusNodeSecondLastName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodeBirthDate = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerSecondName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerSecondLastName =
      TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerAcademicProgram =
      TextEditingController();
  final TextEditingController _controllerBirthDate = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controllerFirstName,
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your first name.";
                        }
                        return null;
                      },
                      onEditingComplete: () =>
                          _focusNodeSecondName.requestFocus(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      controller: _controllerSecondName,
                      focusNode: _focusNodeSecondName,
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Second Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onEditingComplete: () =>
                          _focusNodeLastName.requestFocus(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controllerLastName,
                      focusNode: _focusNodeLastName,
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your last name.";
                        }
                        return null;
                      },
                      onEditingComplete: () =>
                          _focusNodeSecondLastName.requestFocus(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      controller: _controllerSecondLastName,
                      focusNode: _focusNodeSecondLastName,
                      autocorrect: false,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: "Second Last Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (String? value) {
                        return null;
                      },
                      onEditingComplete: () => _focusNodeEmail.requestFocus(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _controllerEmail,
                focusNode: _focusNodeEmail,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
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
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email.";
                  } else if (!(Utilities.validateEmail(value))) {
                    return "Invalid email";
                  }
                  return null;
                },
                onEditingComplete: () => _focusNodeEmail.unfocus(),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField(
                value: _controllerAcademicProgram.text.isEmpty
                    ? null
                    : _controllerAcademicProgram.text,
                decoration: InputDecoration(
                  labelText: "Academic Program",
                  prefixIcon: const Icon(Icons.school_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: _programs
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _controllerAcademicProgram.text = newValue;
                    });
                  }
                },
                validator: (value) => value == null || value.isEmpty
                    ? "Please select your academic program."
                    : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerBirthDate,
                focusNode: _focusNodeBirthDate,
                keyboardType: TextInputType.datetime,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Birth Date",
                  suffixIcon: const Icon(Icons.calendar_today_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onTap: () async {
                  var pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(DateTime.now().year - 12),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _controllerBirthDate.text =
                          pickedDate.toLocal().toString().split(' ')[0];
                    });
                  }
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please select your birth date.";
                  }
                  return null;
                },
                onEditingComplete: () => _focusNodePassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
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
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 character.";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    _focusNodeConfirmPassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerConFirmPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodeConfirmPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
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
                  if (value == null || value.isEmpty) {
                    return "Please confirm your password.";
                  } else if (value != _controllerPassword.text) {
                    return "Password doesn't match.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  BlocConsumer<RemoteUserBloc, RemoteUserState>(
                    listener: (context, state) {
                      if (state is RemoteUserRegistered) {
                        _formKey.currentState?.reset();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: const Text(
                              'Registered successfully',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            backgroundColor: Colors.black.withOpacity(.7),
                            duration: const Duration(seconds: 5),
                          ),
                        );
                        Navigator.pop(context);
                      } else if (state is RegisterUserError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              state.message![0],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            backgroundColor: Colors.black.withOpacity(.7),
                            duration: const Duration(seconds: 5),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: (state is RegisteringUser)
                            ? null
                            : () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  var user = UserModel(
                                    companyId: context
                                            .read<RemoteCompanyBloc>()
                                            .state
                                            .company!
                                            .id ??
                                        1,
                                    firstName: _controllerFirstName.text.trim(),
                                    secondName: _controllerSecondName.text.trim(),
                                    lastName: _controllerLastName.text.trim(),
                                    secondLastName:
                                        _controllerSecondLastName.text.trim(),
                                    dateOfBirth: DateTime.parse(
                                        _controllerBirthDate.text.trim()),
                                    email: _controllerEmail.text.trim(),
                                    password: _controllerPassword.text.trim(),
                                    academicProgram:
                                        _controllerAcademicProgram.text.trim(),
                                  );
                                  context
                                      .read<RemoteUserBloc>()
                                      .add(RegisterUser(user));
                                }
                              },
                        child: (state is RegisteringUser)
                            ? const PlatformActivityIndicator(light: false)
                            : const Text("Register"),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodeSecondName.dispose();
    _focusNodeLastName.dispose();
    _focusNodeSecondLastName.dispose();
    _focusNodeEmail.dispose();
    _focusNodeBirthDate.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerFirstName.dispose();
    _controllerSecondName.dispose();
    _controllerLastName.dispose();
    _controllerSecondLastName.dispose();
    _controllerEmail.dispose();
    _controllerAcademicProgram.dispose();
    _controllerBirthDate.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}
