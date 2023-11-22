import 'package:bookpal/app/widgets/book_description/book_synopsis.dart';
import 'package:bookpal/app/widgets/book_description/borrow_button.dart';
import 'package:bookpal/app/widgets/book_description/rating_menu.dart';
import 'package:bookpal/app/widgets/book_description/ratings_row.dart';
import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:bookpal/app/widgets/loading/shimmer_image.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/favorites/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.book, this.scanned = false});

  final PhysicalBookModel book;
  final bool scanned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: (scanned) ? BorrowButton(book: book) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left,
              size: 32,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Theme.of(context).colorScheme.primary,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: FutureBuilder(
                              future: Utilities.getDownloadUrl(
                                  '$booksCoversPath${book.bookCover}'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return _buildBookCover(
                                      context, const ThemeShimmer());
                                } else if (snapshot.hasError) {
                                  return _buildBookCover(
                                      context, const Icon(Icons.error_outline));
                                }
                                return _buildBookCover(
                                    context, ShimmerImage(url: snapshot.data!));
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.85)
                              .withBlue(85),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        book.title,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 6),
                                        child: Text(
                                          'By ${book.author}',
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RatingsRow(book: book),
                                          const Divider(),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            child: Text(
                                              '${book.available!} book${(book.available! > 1) ? 's' : ''} in library',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const BookSynopsis(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: RatingMenu(
                                    bookBarcode: book.barcode,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      ((scanned) ? .11 : .08),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.36,
                    right: 30,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      shape: const CircleBorder(),
                      child: BlocBuilder<FavoritesBloc, FavoritesState>(
                        builder: (context, state) {
                          var favBooksIds = [];
                          if (state is FavoritesLoaded) {
                            favBooksIds = state.favoritesList!
                                .map((e) => e.physicalBook.id)
                                .toList();
                          }
                          return Icon(
                            (favBooksIds.contains(book.id))
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 32,
                            color: Colors.red,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildBookCover(BuildContext context, Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.width * 0.6,
        child: child,
      ),
    );
  }
}
