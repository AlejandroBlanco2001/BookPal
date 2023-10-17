import 'package:bookpal/app/pages/main_page/main_page.dart';
import 'package:bookpal/core/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  await InitializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    runApp(BookPal(prefs: prefs));
  });
}

class BookPal extends StatelessWidget {
  const BookPal({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BookPalHomePage(title: 'Flutter Demo Home Page'),
      );
  }
}
