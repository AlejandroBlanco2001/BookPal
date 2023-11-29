import 'package:bookpal/app/widgets/book_description/book_synopsis.dart';
import 'package:bookpal/app/widgets/book_description/borrow_button.dart';
import 'package:bookpal/app/widgets/book_description/rating_menu.dart';
import 'package:bookpal/app/widgets/book_description/ratings_row.dart';
import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:bookpal/app/widgets/loading/platform_activity_indicator.dart';
import 'package:bookpal/app/widgets/loading/shimmer_image.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/favorites/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BookDescription extends StatefulWidget {
  const BookDescription({super.key, required this.book, this.scanned = false});

  final PhysicalBookModel book;
  final bool scanned;

  @override
  State<BookDescription> createState() => _BookDescriptionState();
}

class _BookDescriptionState extends State<BookDescription>
    with TickerProviderStateMixin {
  late AnimationController _favoriteController;

  @override
  void initState() {
    _favoriteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      value: (context
              .read<FavoritesBloc>()
              .state
              .favoritesList
              .map((e) => e.physicalBookBarcode)
              .contains(widget.book.barcode))
          ? 0.6
          : 0.0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          (widget.scanned) ? BorrowButton(book: widget.book) : null,
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
                                  '$booksCoversPath${widget.book.bookCover}'),
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
                                        widget.book.title,
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
                                          'By ${widget.book.author}',
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
                                          RatingsRow(book: widget.book),
                                          const Divider(),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 6),
                                            child: Text(
                                              '${widget.book.available!} book${(widget.book.available! > 1) ? 's' : ''} in library',
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
                                    bookBarcode: widget.book.barcode,
                                  ),
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      ((widget.scanned) ? .11 : .08),
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
                      onPressed: () {
                        if (_favoriteController.status ==
                            AnimationStatus.dismissed) {
                          _favoriteController.reset();
                          _favoriteController.animateTo(0.6);
                          context
                              .read<FavoritesBloc>()
                              .add(AddFavorite(widget.book));
                        } else {
                          _favoriteController.reverse();
                          context
                              .read<FavoritesBloc>()
                              .add(RemoveFavorite(widget.book.barcode));
                        }
                      },
                      backgroundColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      shape: const CircleBorder(),
                      child: BlocConsumer<FavoritesBloc, FavoritesState>(
                        listener: (context, state) {
                          if (state is AddFavoriteError) {
                            if (_favoriteController.status ==
                                AnimationStatus.completed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text(
                                    'Could not add book to favorites',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  backgroundColor: Colors.black.withOpacity(.7),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                              _favoriteController.reverse();
                            }
                          } else if (state is RemoveFavoriteError) {
                            if (_favoriteController.status ==
                                AnimationStatus.dismissed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text(
                                    'Could not remove book from favorites',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  backgroundColor: Colors.black.withOpacity(.7),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                              _favoriteController.animateTo(0.6);
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is FavoritesFetched ||
                              state is FavoritesUpdated ||
                              state is FavoritesUpdatedTemp) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Lottie.asset("assets/icons/heart.json",
                                  controller: _favoriteController),
                            );
                          } else if (state is FetchingFavorites) {
                            return const PlatformActivityIndicator();
                          } else {
                            return const SizedBox();
                          }
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
