import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:bookpal/app/navigator.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/barcode/bloc/barcode_bloc.dart';
import 'package:bookpal/presentation/company/remote_bloc/remote_company_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
import 'package:bookpal/presentation/nfc/bloc/nfc_bloc.dart';
import 'package:bookpal/presentation/physical_book/remote_bloc/remote_physical_book_bloc.dart';
import 'package:bookpal/presentation/user/remote_bloc/remote_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          create: (context) => getIt(),
        ),
        BlocProvider<RemotePhysicalBookBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<RemoteCompanyBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<RemoteLoanBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<BarcodeBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<NfcBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) =>
              getIt()..add(const Login("florix@gmail.com", "B00rgir_9116")),
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
