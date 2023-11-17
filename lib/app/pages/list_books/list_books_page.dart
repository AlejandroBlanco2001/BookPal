import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBooks extends StatelessWidget {
  const ListBooks({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBooksBloc, HomeBooksState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                BlocBuilder<HomeBooksBloc, HomeBooksState>(
                  builder: (context, state) {
                    return ListView(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: _buildFavoriteBooks(state.allBooks),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildFavoriteBooks(List<PhysicalBookModel> books) {
    List<Widget> booksList = [];
    for (var book in books) {
      booksList.add(BookCard2(
        book: book,
      ));
    }
    return booksList;
  }
}
