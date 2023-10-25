import 'package:flutter/material.dart';

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
                    width: 200,
                    height: 150,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
