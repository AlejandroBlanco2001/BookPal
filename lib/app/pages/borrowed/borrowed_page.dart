import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:flutter/material.dart';

class Borrowed extends StatelessWidget {
  const Borrowed({super.key});

  @override
  Widget build(BuildContext context) {
    const borrowedBooks = [
      {
        'imageUrl':
            'https://editorial.unach.mx/documentos/productos/portadacalculoo.jpg',
        'title': 'Calculus 1',
        'author': 'By Nirat Bhatnagar',
        'timeLeft': '3 days left'
      },
      {
        'imageUrl':
            'https://marketplace.canva.com/EAE8OIM9H7k/1/0/1003w/canva-verde-y-rosa-ciencia-ficci%C3%B3n-portada-de-libro-q9fLuVysMAw.jpg',
        'title': 'Thinking about',
        'author': 'By Nirat Bhatnagar',
        'timeLeft': '8 days left'
      },
      {
        'imageUrl':
            'https://4.bp.blogspot.com/-9ncqKnRtndE/UDJWrHJxnbI/AAAAAAAABFk/cC3QEzxzM-U/s1600/schulz_and_peanuts.large.jpg',
        'title': 'Calculus 1',
        'author': 'By Nirat Bhatnagar',
        'timeLeft': '3 days left'
      }
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 48,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Your Books',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children:
                  _buildRecentlyBorrowedBooks(borrowedBooks).take(3).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildRecentlyBorrowedBooks(List<Map<String, String>> books) {
  List<Widget> booksList = [];
  for (var book in books) {
    booksList.add(BookCard2(
      imageUrl: book['imageUrl']!,
      title: book['title']!,
      author: book['author']!,
      timeLeft: book['timeLeft']!,
      isFavorite: false,
    ));
  }
  return booksList;
}
