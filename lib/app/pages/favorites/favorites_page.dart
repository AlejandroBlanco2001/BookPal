import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    const favoriteBooks = [
      {
        'imageUrl':
            'https://media.revistaad.es/photos/60c227359ae22619e08751b2/master/w_1600%2Cc_limit/247747.jpg',
        'title': 'Matar a un ruiseñor',
        'author': 'By Harper Lee'
      },
      {
        'imageUrl':
            'https://www.letraminuscula.com/wp-content/uploads/Portada-55x85-EL-CAMINO-DE-LA-GUERRERA-663x1024.jpg',
        'title': 'Guerrera',
        'author': 'By Elizabeth Gilbert'
      },
      {
        'imageUrl':
            'https://cdn.domestika.org/c_fill,dpr_auto,f_auto,q_auto/v1547929697/content-items/002/728/738/Captura_de_pantalla_2019-01-19_a_las_21.22.29-original.png?1547929697',
        'title': 'Semilla Feliz',
        'author': 'By Jose Luis'
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
                'Favorites',
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
              children: _buildFavoriteBooks(favoriteBooks),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildFavoriteBooks(List<Map<String,String>> books) {
  List<Widget> booksList = [];
  for (var book in books) {
    booksList.add(BookCard2(
      imageUrl: book['imageUrl']!,
      title: book['title']!,
      author: book['author']!,
      isFavorite: true
    ));
  }
  return booksList;
}
