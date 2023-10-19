import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocBuilder<RemoteUserBloc, RemoteUserState>(
              builder: (_, state) {
                if (state is RemoteUserLoading){
                  return const CupertinoActivityIndicator();
                }
                if (state is RemoteUserInitial){
                  return Text(
                    state.id!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                if (state is RemoteUserError){
                  return const Center(child: Icon(Icons.refresh));
                }
                if (state is RemoteUserLoaded){
                  return Text(
                    state.user!.email,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          context.read<RemoteUserBloc>().add(const GetUser('5'))
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
