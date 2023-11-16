import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:bookpal/app/widgets/profile_page/logout_button.dart';
import 'package:bookpal/app/widgets/profile_page/settings_card.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Your profile',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
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
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                border: Border(
                    bottom: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
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
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, loginState) {
                              return FutureBuilder(
                                future: Utilities.getDownloadUrl(
                                    '$usersAvatarsPath${loginState.jwt!['decoded_jwt']['profile_image']}'),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const ThemeShimmer();
                                  } else if (snapshot.hasError) {
                                    logger.d(
                                        "Error getting download Url. Message: ${snapshot.error}\nStackTrace: ${snapshot.stackTrace}");
                                    return Center(
                                      child: Icon(
                                        Icons.error,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                    );
                                  } else {
                                    return CachedNetworkImage(
                                        imageUrl: snapshot.data!);
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
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.jwt!['decoded_jwt']['email'],
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
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
