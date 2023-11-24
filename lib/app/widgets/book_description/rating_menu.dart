import 'package:bookpal/app/widgets/book_description/star.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/presentation/authentication/bloc/login_bloc.dart';
import 'package:bookpal/presentation/favorites/bloc/favorite_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/user_borrowed_bloc.dart';
import 'package:bookpal/presentation/physical_book/home_books_bloc/home_books_bloc.dart';
import 'package:bookpal/presentation/rating/bloc/user_ratings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jumping_dot/jumping_dot.dart';

class RatingMenu extends StatefulWidget {
  const RatingMenu({super.key, required this.bookBarcode});

  final String bookBarcode;

  @override
  State<RatingMenu> createState() => _RatingMenuState();
}

class _RatingMenuState extends State<RatingMenu> {
  @override
  void initState() {
    var state = context.read<UserRatingsBloc>().state;
    _rating = getRating(state);
    super.initState();
  }

  double _rating = 0;

  double getRating(UserRatingsState state) {
    if (state is UserRatingsFetched ||
        state is UserRatingsUpdated ||
        state is UserRatingsUpdatedTemp) {
      var indexOfBook = state.userRatings!
          .map((e) => e.physicalBookBarcode)
          .toList()
          .indexOf(widget.bookBarcode);
      return (indexOfBook != -1)
          ? state.userRatings![indexOfBook].rating.toDouble()
          : 0.0;
    } else {
      return 0.0;
    }
  }

  void upateRating(double newRating) {
    setState(() {
      _rating = newRating;
    });
  }

  bool colored(int index) {
    return index < _rating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Rate this book:',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: BlocConsumer<UserRatingsBloc, UserRatingsState>(
            listener: (context, state) {
              upateRating(getRating(state));
              if (state is RateBookError || state is UpdateRatingError) {
                if (state is RateBookError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: const Text(
                        'Could not rate book. Please try again later.',
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
                } else if (state is UpdateRatingError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: const Text(
                        'Could not update rating. Please try again later.',
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
                }
              }
              if (state is UserRatingsUpdatedTemp) logger.d("UpdatingTemp");
              if (state is UserRatingsUpdated) {
                var homeBooksBloc = context.read<HomeBooksBloc>();
                var borrowedBooksBloc = context.read<UserBorrowedBloc>();
                var favoritesBloc = context.read<FavoritesBloc>();
                if (homeBooksBloc.state.allBooks
                    .map((e) => e.barcode)
                    .contains(widget.bookBarcode)) {
                  logger.d("Updating home books");
                  homeBooksBloc.add(RefreshHomeBook(widget.bookBarcode));
                }
                if (borrowedBooksBloc.state.userLoans
                    .map((e) => e.physicalBookBarcode)
                    .contains(widget.bookBarcode)) {
                  borrowedBooksBloc.add(const RefreshBorrowed());
                }
                if (favoritesBloc.state.favoritesList!
                    .map((e) => e.physicalBook.barcode)
                    .contains(widget.bookBarcode)) {
                  favoritesBloc.add(const RefreshFavorites());
                }
              }
            },
            builder: (context, state) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(
                  6,
                  (index) => (index < 5)
                      ? GestureDetector(
                          onTap: () {
                            if (context.read<LoginBloc>().state
                                is LoginSuccess) {
                              if (_rating > 0) {
                                context.read<UserRatingsBloc>().add(
                                    UpdateRating(
                                        state
                                            .userRatings![state.userRatings!
                                                .map((e) =>
                                                    e.physicalBookBarcode)
                                                .toList()
                                                .indexOf(widget.bookBarcode)]
                                            .id!,
                                        index.toDouble() + 1));
                              } else if (_rating == 0) {
                                context.read<UserRatingsBloc>().add(RateBook(
                                    widget.bookBarcode, index.toDouble() + 1));
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text(
                                    'Please login to rate books.',
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
                            }
                          },
                          child: Star(
                            colored: colored(index),
                            fontSize: 30,
                            shadows: true,
                          ),
                        )
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: AnimatedCrossFade(
                              firstChild: Text(
                                _rating.toStringAsPrecision(2),
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 18,
                                ),
                              ),
                              secondChild: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: IntrinsicWidth(
                                    child: JumpingDots(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      numberOfDots: 3,
                                      verticalOffset: 10,
                                      innerPadding: 3,
                                      radius: 3,
                                    ),
                                  ),
                                ),
                              ),
                              crossFadeState: (state is FetchingUserRatings)
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 300),
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
