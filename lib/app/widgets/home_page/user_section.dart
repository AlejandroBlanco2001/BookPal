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
              padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
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
                              return const ClipOval(
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: ThemeShimmer(),
                                ),
                              );
                            }
                            return CachedNetworkImage(
                              imageUrl: snapshot.data!,
                              imageBuilder: (context, imageProvider) {
                                return CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.white,
                                  backgroundImage: imageProvider,
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
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      String? text;
                      if (state is LoginInitial ||
                          state is LoggingOut ||
                          state is LoginError) {
                        text = "Please login...";
                      } else if (state is LoginLoading) {
                        text = "Loading...";
                      } else {
                        text =
                            "Hi, ${state.jwt!['decoded_jwt']['name'].split(" ")[0]}!";
                      }
                      return Text(
                        text,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      );
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
