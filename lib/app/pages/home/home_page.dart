import 'package:bookpal/app/widgets/home_page/book_row.dart';
import 'package:bookpal/app/widgets/home_page/retry_fecth.dart';
import 'package:bookpal/app/widgets/items/book_cards.dart';
import 'package:bookpal/app/widgets/loading/platform_activity_indicator.dart';
import 'package:bookpal/app/widgets/scanning/select_scan_method_button.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookPalHomePage extends StatelessWidget {
  const BookPalHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: const SelectScanMethodButton(),
      backgroundColor: Theme.of(context).colorScheme.primary,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginInitial) {
                                return const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/default_avatar.jpg'),
                                    radius: 35,
                                    backgroundColor: Colors.white);
                              } else if (state is LoginSuccess) {
                                return FutureBuilder(
                                  future:
                                      Utilities.getProfileImageDownloadUrl(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError ||
                                        !snapshot.hasData) {
                                      return const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/default_avatar.jpg'),
                                          radius: 35,
                                          backgroundColor: Colors.white);
                                    }
                                    return CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(snapshot.data!),
                                        radius: 35,
                                        backgroundColor: Colors.white);
                                  },
                                );
                              } else if (state is LoggingOut ||
                                  state is LoginLoading) {
                                return const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/default_avatar.jpg'),
                                    radius: 35,
                                    backgroundColor: Colors.white);
                              } else {
                                return const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/default_avatar.jpg'),
                                    radius: 35,
                                    backgroundColor: Colors.white);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                      margin: const EdgeInsets.fromLTRB(0, 16.0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Hi, John!',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 24.0),
                  child: Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 32,
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for books',
                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  fillColor: Theme.of(context).colorScheme.primaryContainer,
                  filled: true,
                  border: const OutlineInputBorder(
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
                  Text(
                    'Popular',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See all',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<HomeBooksBloc, HomeBooksState>(
              builder: (context, state) {
                if (state is HomeBooksLoading || state is HomeBooksInitial) {
                  return const PlatformActivityIndicator();
                } else if (state is HomeBooksError) {
                  return RetryFetch(
                      fetchMethod: () =>
                          context.read<HomeBooksBloc>().add(FetchHomeBooks()));
                }
                // logger.d("HomeBook 1: ${state.allBooks.map((e) => e.toJson())}");
                return ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: _buildPopularBooks(state.allBooks.take(3).toList()),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Your Recently Borrowed Books',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24.0, 12.0, 0, 0),
              height: 120,
              child: BlocBuilder<HomeBooksBloc, HomeBooksState>(
                builder: (context, state) {
                  if (state is HomeBooksError) {
                    return RetryFetch(
                        fetchMethod: () => context
                            .read<HomeBooksBloc>()
                            .add(FetchHomeBooks()));
                  }
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: _buildRecentlyBorrowedBooks(state.allBooks),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPopularBooks(List<PhysicalBookModel> books) {
    List<Widget> booksList = [];
    for (var book in books) {
      logger.d("Book ${book.title} cover: $booksCoversPath${book.bookCover}");
      booksList.add(
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BookRow(book: book),
        ),
      );
    }
    return booksList;
  }

  List<Widget> _buildRecentlyBorrowedBooks(List<PhysicalBookModel> books) {
    List<Widget> booksList = [];
    for (var book in books) {
      booksList.add(BookCard1(book));
    }
    return booksList;
  }
}
