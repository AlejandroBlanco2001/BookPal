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
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(.7),
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

class BookCard2 extends StatelessWidget {
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

  PhysicalBookModel _getBook() {
    if (book != null) {
      return book!;
    } else if (loan != null) {
      return loan!.physicalBook as PhysicalBookModel;
    } else {
      return favorite!.physicalBook as PhysicalBookModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    PhysicalBookModel book = _getBook();
    String timeLeft = Utilities.getTimeLeft(loan);

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
                            mainAxisAlignment: (loan != null)
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
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  book.author,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              (loan != null)
                                  ? FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        timeLeft,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: (loan!.status.name ==
                                                  'overdue')
                                              ? Colors.red
                                              : (loan!.status.name == 'active')
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
                      flex: 3,
                      child: Container(
                        child: (loan != null)
                            ? (loan!.status.name == 'active' ||
                                    loan!.status.name == 'overdue')
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
                                              logger.d("Escaneado qr: ${state.qrScanRes}");
                                              context
                                                  .read<RemoteLoanBloc>()
                                                  .add(
                                                      MakeLoanReturn(loan!.id, state.qrScanRes!));
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
                            : BlocBuilder<FavoritesBloc, FavoritesState>(
                                builder: (context, state) {
                                  if (state is FavoritesLoaded) {
                                    var favBooksIds = state.favoritesList!
                                        .map((e) => e.physicalBook.id)
                                        .toList();
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: IconButton(
                                        onPressed: () {
                                          // TODO: Toggle favorites
                                        },
                                        icon: Icon(
                                          (favBooksIds.contains(book.id))
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.red,
                                        ),
                                      ),
                                    );
                                  } else if (state is FavoritesLoading) {
                                    return const PlatformActivityIndicator();
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                      ),
                    )
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
