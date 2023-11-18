import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:bookpal/app/widgets/profile_page/default_circle_avatar.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginInitial) {
                        return const DefaultCircleAvatar();
                      } else if (state is LoginSuccess) {
                        return FutureBuilder(
                          future: Utilities.getProfileImageDownloadUrl(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const DefaultCircleAvatar();
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return ClipOval(
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: const ThemeShimmer(),
                                ),
                              );
                            }
                            return CachedNetworkImage(
                              imageUrl: snapshot.data!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      width: 2,
                                    ),
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.white,
                                    backgroundImage: imageProvider,
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return const ThemeShimmer();
                              },
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      } else if (state is LoggingOut) {
                        return const DefaultCircleAvatar();
                      } else if (state is LoginLoading) {
                        return const ClipOval(
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: ThemeShimmer(),
                          ),
                        );
                      } else {
                        return const DefaultCircleAvatar();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, right: 24.0),
          child: Icon(
            Icons.notifications,
            color: Theme.of(context).colorScheme.secondary,
            size: 32,
          ),
        )
      ],
    );
  }
}
