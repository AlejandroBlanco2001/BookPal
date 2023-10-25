import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

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
              'Favorites',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const BookCard(
              imageUrl:
                  'https://media.revistaad.es/photos/60c227359ae22619e08751b2/master/w_1600%2Cc_limit/247747.jpg',
              title: 'Matar a un ruiseñor',
              author: 'By Harper Lee'),
          const BookCard(
              imageUrl:
                  'https://www.letraminuscula.com/wp-content/uploads/Portada-55x85-EL-CAMINO-DE-LA-GUERRERA-663x1024.jpg',
              title: 'Guerrera',
              author: 'By Elizabeth Gilbert'),
          const BookCard(
              imageUrl:
                  'https://cdn.domestika.org/c_fill,dpr_auto,f_auto,q_auto/v1547929697/content-items/002/728/738/Captura_de_pantalla_2019-01-19_a_las_21.22.29-original.png?1547929697',
              title: 'Semilla Feliz',
              author: 'By Jose Luis'),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  const BookCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.author,
  }) : super(key: key);

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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: Text(
                            author,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
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
