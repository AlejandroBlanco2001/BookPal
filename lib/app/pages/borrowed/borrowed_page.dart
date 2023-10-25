import 'package:flutter/material.dart';

class Borrowed extends StatelessWidget {
  const Borrowed({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: const Text(
              'Your Books',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const BookCard(
              imageUrl:
                  'https://editorial.unach.mx/documentos/productos/portadacalculoo.jpg',
              title: 'Calculus 1',
              author: 'By Nirat Bhatnagar',
              description: '3 days left'),
          const BookCard(
              imageUrl:
                  'https://marketplace.canva.com/EAE8OIM9H7k/1/0/1003w/canva-verde-y-rosa-ciencia-ficci%C3%B3n-portada-de-libro-q9fLuVysMAw.jpg',
              title: 'Thinking about',
              author: 'By Nirat Bhatnagar',
              description: '8 days left'),
          const BookCard(
              imageUrl:
                  'https://editorial.risei.org/public/presses/1/submission_4_5_coverImage_es_ES_t.jpg',
              title: 'Calculus 1',
              author: 'By Nirat Bhatnagar',
              description: '3 days left'),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String description;

  const BookCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            elevation: 5,
            color: const Color.fromARGB(255, 61, 63, 84),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 110,
                  padding: const EdgeInsets.only(left: 100),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          author,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Renew',
                      style: TextStyle(
                        color: Color.fromARGB(255, 241, 92, 81),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -15,
            left: 15,
            child: SizedBox(
                height: 110,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18), // Image border
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(24), // Image radius
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
