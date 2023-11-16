import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:bookpal/presentation/theme/bloc/theme_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hexcolor/hexcolor.dart';
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
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
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
        BlocProvider<HomeBooksBloc>(create: 
          (context) => getIt()..add(FetchHomeBooks()),
        ),
        BlocProvider<RemoteCompanyBloc>(
          create: (context) => getIt()..add(InitCompany()),
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
          create: (context) => getIt()..add(InitLogin()),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => getIt()..add(ToHomePage()),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => getIt(),
        ),
      ],
      child: BlocBuilder<RemoteCompanyBloc, RemoteCompanyState>(
        builder: (context, state) {
          if (state is RemoteCompanyLoading ||
              state is RemoteCompanyError ||
              state is RemoteCompanyInitial) {
            if (state is RemoteCompanyError) {
              logger.d("Retrying init company");
              context.read<RemoteCompanyBloc>().add(InitCompany());
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                body: Center(
                  child: (defaultTargetPlatform == TargetPlatform.iOS)
                      ? const CupertinoActivityIndicator()
                      : const CircularProgressIndicator(),
                ),
              ),
            );
          }
          return FutureBuilder(
            future: Utilities.getDownloadUrl(
                '$companiesLogosPath${state.company!.logo}'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                context
                    .read<ThemeBloc>()
                    .add(CreateThemeFromLogo(snapshot.data!));
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'BookPal',
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: HexColor(state.company!.primaryColor!),
                    primary: HexColor(state.company!.primaryColor!),
                    secondary: HexColor(state.company!.secondaryColor!),
                  ),
                  useMaterial3: true,
                ),
                home: const MainNavigator(),
              );
            },
          );
        },
      ),
    );
  }
}
