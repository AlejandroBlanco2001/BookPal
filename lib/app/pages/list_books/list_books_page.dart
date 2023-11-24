import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/app/widgets/loading/empty_book_list.dart';
import 'package:bookpal/app/widgets/loading/loading_list.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:bookpal/presentation/physical_book/remote_bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBooks extends StatelessWidget {
  const ListBooks({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
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
              builder: (context, homeState) {
                if (homeState is HomeBooksError) {
                  return RetryFetch(
                      fetchMethod: () =>
                          context.read<HomeBooksBloc>().add(FetchHomeBooks()));
                }
                return BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, searchState) {
                    if (searchState is SearchLoading ||
                        homeState is HomeBooksLoading) {
                      return const ListBooksShimmer();
                    } else if (searchState is SearchError) {
                      return RetryFetch(
                          fetchMethod: () => context
                              .read<SearchBloc>()
                              .add(Search(searchState.query!)));
                    }
                    if ((title == 'Search Results' &&
                            searchState.books.isEmpty) ||
                        (title == 'Popular Books' &&
                            homeState.allBooks.isEmpty)) {
                      return const EmptyBookList(title: 'No results found');
                    }
                    return ListView(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      children: _buildFavoriteBooks((title == 'Popular Books')
                          ? homeState.allBooks
                          : (title == 'Search Results')
                              ? searchState.books
                              : []),
                    );
                  },
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
      booksList.add(BookCard2(
        book: book,
      ));
    }
    return booksList;
  }
}
