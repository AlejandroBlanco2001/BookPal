import 'package:flutter/material.dart';
import 'package:bookpal/app/widgets/successful_dialog.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(6.0, 12.0, 12.0, 0),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 140,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://images-na.ssl-images-amazon.com/images/I/81eB+7+CkUL.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'The Midnight Library',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: const Text(
                            'By Matt Haig',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 2.0),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 2.0),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 2.0),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 2.0),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 2.0),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 4.0),
                                child: const Text(
                                  '4.5',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 8.0),
                                child: const Text(
                                  '(1.2k)',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          child: const Text(
                            '3 books in library',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromARGB(255, 249, 125, 127),
                                      Color.fromARGB(255, 241, 70, 72),
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const SuccessfulDialog();
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    'Borrow now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                margin: const EdgeInsets.only(left: 16.0),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromARGB(255, 78, 112, 213),
                                      Color.fromARGB(255, 54, 81, 196),
                                    ],
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0),
                child: const Text(
                  'Synopsis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(32.0, 16, 32.0, 0),
                child: const Text(
                  'Fiction | Science Fiction | Fantasy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(32.0, 16, 32.0, 0),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Nora Seed finds herself faced with this decision. Faced with the possibility of changing her life for a new one, following a different career, undoing old breakups, realizing her dreams of becoming a glaciologist; she must search within herself as she travels through the Midnight Library to decide what is truly fulfilling in life, and what makes it worth living in the first place.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(32, 32, 32.0, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Similar Books',
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
                margin: const EdgeInsets.fromLTRB(32, 12.0, 0, 0),
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
        ],
      ),
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
