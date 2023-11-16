import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/app/widgets/loading/loading_popular.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {

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
            BlocBuilder<HomeBooksBloc, HomeBooksState>(
              builder: (context, state) {
                if (state is HomeBooksLoading || state is HomeBooksInitial) {
                  return const PopularBooksShimmer();
                } else if (state is HomeBooksError) {
                  return RetryFetch(
                      fetchMethod: () =>
                          context.read<HomeBooksBloc>().add(FetchHomeBooks()));
                }
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
  }

  List<Widget> _buildFavoriteBooks(List<PhysicalBookModel> books) {
    List<Widget> booksList = [];
    for (var book in books) {
      booksList.add(BookCard2(book: book, isBorrowed: false));
    }
    return booksList;
  }
}
