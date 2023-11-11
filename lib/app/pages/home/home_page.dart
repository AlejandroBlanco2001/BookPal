import 'package:bookpal/app/widgets/home_page/book_cards.dart';
import 'package:bookpal/app/widgets/home_page/book_row.dart';
import 'package:bookpal/app/widgets/scanning/select_scan_method_button.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookPalHomePage extends StatelessWidget {
  const BookPalHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Map<String, String>> books = [
      {
        'coverUrl':
            'https://images.cdn1.buscalibre.com/fit-in/360x360/69/5b/695b0830dd6fb907b7ae97a127d0bbc2.jpg',
        'title': 'Cancion de Hielo y Fuego',
        'author': 'George R. R. Martin'
      },
      {
        'coverUrl':
            'https://images.cdn3.buscalibre.com/fit-in/360x360/89/38/8938e3868a3a64298f347667f27eb5ad.jpg',
        'title': 'Maze Runner',
        'author': 'James Dashner'
      },
      {
        'coverUrl':
            'https://i.guim.co.uk/img/media/9a19fedf27882429f0287ecf5ea24b0e5c582c3f/0_0_2359_3543/master/2359.jpg?width=1010&quality=45&auto=format&fit=max&dpr=2&s=d4451cc1ac973f4c97c4de4dcfe376b4',
        'title': 'Harry Potter',
        'author': 'J. K. Rowling'
      }
    ];

    const recentlyBorrowed = [
      'https://editorial.unach.mx/documentos/productos/portadacalculoo.jpg',
      'https://marketplace.canva.com/EAE8OIM9H7k/1/0/1003w/canva-verde-y-rosa-ciencia-ficci%C3%B3n-portada-de-libro-q9fLuVysMAw.jpg',
      'https://editorial.unach.mx/documentos/productos/portadacalculoo.jpg',
      'https://marketplace.canva.com/EADzX5l_Aq4/1/0/1003w/canva-naranja-y-oscuro-p%C3%BArpura-triangular-moderno-arquitectura-libro-portada-plWZGVV8298.jpg',
      'https://4.bp.blogspot.com/-9ncqKnRtndE/UDJWrHJxnbI/AAAAAAAABFk/cC3QEzxzM-U/s1600/schulz_and_peanuts.large.jpg'
    ];

    return Scaffold(
      floatingActionButton: const SelectScanMethodButton(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                      margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://www.cu.edu.ph/wp-content/uploads/2020/10/girl-avatar.png'),
                              radius: 35,
                              backgroundColor: Colors.white)
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                        margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Hi, John!',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24, right: 24.0),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.grey,
                    size: 32,
                  ),
                )
              ],
            ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Popular',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: _buildPopularBooks(books).take(3).toList(),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Your Recently Borrowed Books',
                    style: TextStyle(
                        color: Colors.grey,
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
                children: _buildRecentlyBorrowedBooks(recentlyBorrowed),
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
                onPressed: () {
                  context
                      .read<RemoteLoanBloc>()
                      .add(CreateLoan("phone_token", "000000200000003"));
                },
                icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildPopularBooks(List<Map<String, String>> books) {
  List<Widget> booksList = [];
  for (var book in books) {
    booksList.add(BookRow(
      coverUrl: book['coverUrl']!,
      title: book['title']!,
      author: book['author']!,
    ));
  }
  return booksList;
}

List<Widget> _buildRecentlyBorrowedBooks(List<String> books) {
  List<Widget> booksList = [];
  for (var book in books) {
    booksList.add(BookCard1(book));
  }
  return booksList;
}
