import 'package:bookpal/app/widgets/home_page/popular_books.dart';
import 'package:bookpal/app/widgets/home_page/recently_borrowed.dart';
import 'package:bookpal/app/widgets/home_page/search_for_books.dart';
import 'package:bookpal/app/widgets/home_page/user_section.dart';
import 'package:flutter/material.dart';

class BookPalHomePage extends StatelessWidget {
  const BookPalHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            UserSection(),
            BookSearchField(),
            PopularBooks(),
            RecentlyBorrowedBooks(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
