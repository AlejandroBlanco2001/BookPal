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
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.primary.withBlue(85).withOpacity(.8),
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'Your profile',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withBlue(85)
                  .withOpacity(.8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30.0, top: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: FutureBuilder(
                          future: Utilities.getDownloadUrl(
                              '$usersAvatarsPath${context.read<LoginBloc>().state.jwt!['decoded_jwt']['profile_image']}'),
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
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              );
                            } else {
                              return CachedNetworkImage(
                                imageUrl: snapshot.data!,
                                fit: BoxFit.cover,
                              );
                            }
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
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              state.jwt!['decoded_jwt']['email'],
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
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
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
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
          ),
        ],
      ),
    );
  }
}
