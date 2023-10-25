import 'package:flutter/material.dart';

class BookPalHomePage extends StatefulWidget {
  const BookPalHomePage({super.key});

  @override
  State<BookPalHomePage> createState() => _BookPalHomePageState();
}

class _BookPalHomePageState extends State<BookPalHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 12.0, 12.0, 0),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 24,
                  ),
                )
              ],
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://png.pngtree.com/png-vector/20220807/ourmid/pngtree-man-avatar-wearing-gray-suit-png-image_6102786.png'),
                        radius: 35,
                        backgroundColor: Colors.white)
                  ],
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Hi, John!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for books',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  fillColor: Color.fromARGB(255, 61, 63, 84),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Popular',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 32.0, 0, 0),
              child: const BookItem(
                imageUrl:
                    'https://images.cdn1.buscalibre.com/fit-in/360x360/69/5b/695b0830dd6fb907b7ae97a127d0bbc2.jpg',
                title: 'Cancion de Hielo y Fuego',
                author: 'George R. R. Martin',
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 0),
              child: const BookItem(
                imageUrl:
                    'https://images.cdn3.buscalibre.com/fit-in/360x360/89/38/8938e3868a3a64298f347667f27eb5ad.jpg',
                title: 'Maze Runner',
                author: 'James Dashner',
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 0),
              child: const BookItem(
                imageUrl:
                    'https://images.cdn2.buscalibre.com/fit-in/360x360/0f/3e/0f3e1b6b4b0b4b4b4b4b4b4b4b4b4b4b.jpg',
                title: 'Harry Potter',
                author: 'J. K. Rowling',
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Your Recently Borrowed Books',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 0),
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  BookCard(
                      'https://editorial.unach.mx/documentos/productos/portadacalculoo.jpg'),
                  BookCard(
                      'https://marketplace.canva.com/EAE8OIM9H7k/1/0/1003w/canva-verde-y-rosa-ciencia-ficci%C3%B3n-portada-de-libro-q9fLuVysMAw.jpg'),
                  BookCard(
                      'https://marketplace.canva.com/EADzX5l_Aq4/1/0/1003w/canva-naranja-y-oscuro-p%C3%BArpura-triangular-moderno-arquitectura-libro-portada-plWZGVV8298.jpg'),
                  BookCard(
                      'https://editorial.risei.org/public/presses/1/submission_4_5_coverImage_es_ES_t.jpg'),
                  BookCard(
                      'https://4.bp.blogspot.com/-9ncqKnRtndE/UDJWrHJxnbI/AAAAAAAABFk/cC3QEzxzM-U/s1600/schulz_and_peanuts.large.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  const BookItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.author})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 35,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              author,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Fiction',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageUrl;

  const BookCard(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        margin: const EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Image border
          child: SizedBox.fromSize(
            size: const Size.fromRadius(24), // Image radius
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
