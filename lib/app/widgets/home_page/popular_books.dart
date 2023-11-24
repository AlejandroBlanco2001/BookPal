import 'package:bookpal/app/pages/list_books/list_books_page.dart';
import 'package:bookpal/app/widgets/home_page/book_row.dart';
import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/loading/loading_popular.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Popular',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const ListBooks(title: 'Popular Books')))),
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.8),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
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
            logger.d("State: ${state.runtimeType}. Books: ${state.allBooks.map((e) => '${e.title}: ${e.rating}')}}");
            return ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: _buildPopularBooks(state.allBooks.take(3).toList()),
            );
          },
        ),
      ],
    );
  }

  List<Widget> _buildPopularBooks(List<PhysicalBookModel> books) {
    List<Widget> booksList = [];
    for (var book in books) {
      booksList.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BookRow(book: book),
        ),
      );
    }
    return booksList;
  }
}
