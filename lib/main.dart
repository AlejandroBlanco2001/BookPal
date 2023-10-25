import 'package:bookpal/app/navigator.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookPal());
}

class BookPal extends StatelessWidget {
  const BookPal({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteUserBloc>(
          create: (context) => sl(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookPal',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainNavigator(),
      ),
    );
  }
}
