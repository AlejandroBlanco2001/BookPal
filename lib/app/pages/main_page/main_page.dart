import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class BookPalHomePage extends StatelessWidget {
  const BookPalHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'User email:',
            ),
            _userBlocInfo(context)
          ],
        ),
      ),
      floatingActionButton: (defaultTargetPlatform == TargetPlatform.android)
          ? FloatingActionButton(
              onPressed: () =>
                  {context.read<RemoteUserBloc>().add(const GetUser(5))},
              child: const Icon(Icons.add),
            )
          : CupertinoButton(
              onPressed: () =>
                  {context.read<RemoteUserBloc>().add(const GetUser(5))},
              child: const Icon(Icons.add),
            ),
    );
  }

  _userBlocInfo(BuildContext context) {
    return BlocBuilder<RemoteUserBloc, RemoteUserState>(
      builder: (_, state) {
        if (state is RemoteUserLoading) {
          return (defaultTargetPlatform == TargetPlatform.iOS)
              ? const CupertinoActivityIndicator()
              : const CircularProgressIndicator();
        }
        if (state is RemoteUserInitial) {
          return Text(
            'Aún no se ha cargado ningún usuario.',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }
        if (state is RemoteUserError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is RemoteUserLoaded) {
          return Text(
            state.user!.email,
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }
        return const SizedBox();
      },
    );
  }
}
