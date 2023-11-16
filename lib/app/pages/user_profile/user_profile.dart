import 'package:bookpal/app/widgets/profile_page/logout_button.dart';
import 'package:bookpal/app/widgets/profile_page/settings_card.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            'Your profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffF5F5F5),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey,
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, loginState) {
                              return FutureBuilder(
                                future: Utilities.getDownloadUrl(
                                    '$usersAvatarsPath${loginState.jwt!['decoded_jwt']['profile_image']}'),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    switch (defaultTargetPlatform) {
                                      case TargetPlatform.android:
                                        return const Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: CircularProgressIndicator(),
                                        );
                                      case TargetPlatform.iOS:
                                        return const Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: CupertinoActivityIndicator(),
                                        );
                                      default:
                                        return const Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: CircularProgressIndicator(),
                                        );
                                    }
                                  } else if (snapshot.hasError) {
                                    logger.d(
                                        "Error getting download Url. Message: ${snapshot.error}\nStackTrace: ${snapshot.stackTrace}");
                                    return Icon(
                                      Icons.error,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    );
                                  } else {
                                    return Image(
                                        image: NetworkImage(snapshot.data!));
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.jwt!['decoded_jwt']['name'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.jwt!['decoded_jwt']['email'],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 73, 39, 176),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SettingsCard(
                title: 'Modify your user info',
                callback: () {
                  logger.d("Quiere modificar su info");
                }),
            SettingsCard(
                title: 'Change your password',
                callback: () {
                  logger.d("Quiere cambiar su contraseña");
                }),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
