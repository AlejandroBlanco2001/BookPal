import 'package:bookpal/app/pages/book_description/book_description_page.dart';
import 'package:bookpal/app/widgets/loading/platform_activity_indicator.dart';
import 'package:bookpal/app/widgets/loading/shimmer_image.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/favorite_model.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:bookpal/presentation/barcode/bloc/qr_bloc.dart';
import 'package:bookpal/presentation/favorites/bloc/favorite_bloc.dart';
import 'package:bookpal/presentation/loan/remote_bloc/remote_loan_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class BookCard1 extends StatelessWidget {
  final LoanModel loan;

  const BookCard1(this.loan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String timeLeft = Utilities.getTimeLeft(loan);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                timeLeft,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (loan.status.name == 'overdue')
                      ? Colors.red
                      : (loan.status.name == 'active')
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(.7),
                  fontSize: 12,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BookDescription(
                              book: loan.physicalBook as PhysicalBookModel);
                        }));
                      },
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      child: Ink(
                        width: 80,
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(10), // Image border
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(24), // Image radius
                            child: FutureBuilder(
                              future: Utilities.getDownloadUrl(
                                  '$booksCoversPath${loan.physicalBook!.bookCover}'),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Shimmer.fromColors(
                                    baseColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return const Center(
                                    child: Icon(Icons.error),
                                  );
                                }
                                return ShimmerImage(url: snapshot.data!);
                              },
                            ),
                          ),
                        ),
                      ),
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

class BookCard2 extends StatefulWidget {
  final PhysicalBookModel? book;
  final LoanModel? loan;
  final FavoriteModel? favorite;

  const BookCard2({Key? key, required this.book})
      : loan = null,
        favorite = null,
        super(key: key);
  const BookCard2.fromLoan({Key? key, required this.loan})
      : favorite = null,
        book = null,
        super(key: key);
  const BookCard2.fromFavorite({Key? key, required this.favorite})
      : loan = null,
        book = null,
        super(key: key);

  @override
  State<BookCard2> createState() => _BookCard2State();
}

class _BookCard2State extends State<BookCard2> with TickerProviderStateMixin {
  late AnimationController _favoriteController;

  @override
  initState() {
    super.initState();
    _favoriteController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
        value: (context
                .read<FavoritesBloc>()
                .state
                .favoritesList
                .map((e) => e.physicalBookBarcode)
                .contains((widget.book != null)
                    ? widget.book!.barcode
                    : (widget.loan != null)
                        ? widget.loan!.physicalBook!.barcode
                        : widget.favorite!.physicalBookBarcode))
            ? 0.6
            : 0.0);
  }

  @override
  void dispose() {
    _favoriteController.dispose();
    super.dispose();
  }

  PhysicalBookModel _getBook() {
    if (widget.book != null) {
      return widget.book!;
    } else if (widget.loan != null) {
      return widget.loan!.physicalBook as PhysicalBookModel;
    } else {
      return widget.favorite!.physicalBook as PhysicalBookModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    PhysicalBookModel book = _getBook();
    String timeLeft = Utilities.getTimeLeft(widget.loan);

    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BookDescription(book: book))),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Card(
                elevation: 5,
                color: const Color.fromARGB(255, 61, 63, 84),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        height: 110,
                        padding: const EdgeInsets.only(left: 100),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: (widget.loan != null)
                                ? MainAxisAlignment.spaceAround
                                : MainAxisAlignment.start,
                            children: [
                              Text(
                                book.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                book.author,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              (widget.loan != null)
                                  ? FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        timeLeft,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: (widget.loan!.status.name ==
                                                  'overdue')
                                              ? Colors.red
                                              : (widget.loan!.status.name ==
                                                      'active')
                                                  ? Theme.of(context)
                                                      .primaryColorLight
                                                  : Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: ((widget.loan == null ||
                                  !(widget.loan!.status.name == 'active' ||
                                      widget.loan!.status.name == 'overdue')) ||
                              widget.favorite == null)
                          ? (widget.favorite == null)
                              ? 0
                              : 2
                          : 3,
                      child: Container(
                        child: (widget.loan != null)
                            ? (widget.loan!.status.name == 'active' ||
                                    widget.loan!.status.name == 'overdue')
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: BlocBuilder<QRBloc, QRState>(
                                      builder: (context, state) {
                                        return TextButton(
                                          onPressed: () {
                                            context
                                                .read<QRBloc>()
                                                .add(const ScanQR());
                                            if (state is QRScanned) {
                                              logger.d(
                                                  "Escaneado qr: ${state.qrScanRes}");
                                              context
                                                  .read<RemoteLoanBloc>()
                                                  .add(MakeLoanReturn(
                                                      widget.loan!.id,
                                                      state.qrScanRes!));
                                            }
                                          },
                                          child: const FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Return',
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 241, 92, 81),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : const SizedBox()
                            : BlocConsumer<FavoritesBloc, FavoritesState>(
                                listener: (context, state) {
                                  if (state is AddFavoriteError) {
                                    if (_favoriteController.status ==
                                        AnimationStatus.completed) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                          backgroundColor:
                                              Colors.black.withOpacity(.7),
                                          duration: const Duration(seconds: 5),
                                        ),
                                      );
                                      _favoriteController.reverse();
                                    }
                                  } else if (state is RemoveFavoriteError) {
                                    if (_favoriteController.status ==
                                        AnimationStatus.dismissed) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                                          backgroundColor:
                                              Colors.black.withOpacity(.7),
                                          duration: const Duration(seconds: 5),
                                        ),
                                      );
                                      _favoriteController.reset();
                                      _favoriteController.animateTo(0.6);
                                    }
                                  }
                                },
                                builder: (context, state) {
                                  if (state is FavoritesFetched ||
                                      state is FavoritesUpdated ||
                                      state is FavoritesUpdatedTemp) {
                                    if (context
                                        .read<FavoritesBloc>()
                                        .state
                                        .favoritesList
                                        .map((e) => e.physicalBookBarcode)
                                        .contains((widget.book != null)
                                            ? widget.book!.barcode
                                            : (widget.loan != null)
                                                ? widget
                                                    .loan!.physicalBook!.barcode
                                                : widget.favorite!
                                                    .physicalBookBarcode)) {
                                      _favoriteController.value = 0.6;
                                    } else {
                                      _favoriteController.value = 0.0;
                                    }
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: IconButton(
                                        onPressed: () {
                                          if (_favoriteController.status ==
                                              AnimationStatus.dismissed) {
                                            _favoriteController.reset();
                                            _favoriteController.animateTo(0.6);
                                            context
                                                .read<FavoritesBloc>()
                                                .add(AddFavorite(book));
                                          } else {
                                            _favoriteController.reverse();
                                            context.read<FavoritesBloc>().add(
                                                RemoveFavorite(book.barcode));
                                          }
                                        },
                                        icon: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .09,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .09,
                                          child: Lottie.asset(
                                              "assets/icons/heart.json",
                                              controller: _favoriteController),
                                        ),
                                      ),
                                    );
                                  } else if (state is FetchingFavorites) {
                                    return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .09,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                .09,
                                        child:
                                            const PlatformActivityIndicator());
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
              Positioned(
                top: -15,
                left: 15,
                child: SizedBox(
                  height: 110,
                  width: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18), // Image border
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(24), // Image radius
                      child: FutureBuilder(
                        future: Utilities.getDownloadUrl(
                            '$booksCoversPath${book.bookCover}'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Icon(Icons.error),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Shimmer.fromColors(
                              baseColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                              ),
                            );
                          }
                          return ShimmerImage(url: snapshot.data!);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
