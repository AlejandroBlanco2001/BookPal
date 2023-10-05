import 'package:bookpal/app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const BookPalState());
}

class BookPalState extends StatelessWidget {
  const BookPalState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: BookPal(),
    );
  }
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