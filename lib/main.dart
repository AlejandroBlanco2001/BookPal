import 'package:bookpal/app/pages/main_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const BookPal());
}


class BookPal extends StatelessWidget {
  const BookPal({super.key});

  // This widget is the root of your application.
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