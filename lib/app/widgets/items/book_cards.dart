import 'package:bookpal/app/pages/book_description/book_description_page.dart';
import 'package:bookpal/app/widgets/loading/shimmer_image.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/favorite_model.dart';
import 'package:bookpal/data/models/loan_model.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookCard1 extends StatelessWidget {
  final PhysicalBookModel book;

  const BookCard1(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return BookDescription(book: book);
            }));
          },
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          child: Ink(
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Image border
              child: SizedBox.fromSize(
                size: const Size.fromRadius(24), // Image radius
                child: FutureBuilder(
                  future: Utilities.getDownloadUrl(
                      '$booksCoversPath${book.bookCover}'),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Shimmer.fromColors(
                        baseColor:
                            Theme.of(context).colorScheme.primaryContainer,
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

  String _setTimeLeft() {
    if (loan != null) {
      if (loan!.status.name == 'active') {
        var difference = loan!.dueDate.difference(loan!.startDate);
        if (difference.inDays < 1) {
          if (difference.inHours < 1) {
            return '${difference.inMinutes} minutes left';
          } else {
            return '${difference.inHours} hours left';
          }
        } else {
          return '${difference.inDays} days left';
        }
      } else if (loan!.status.name == 'Overdue') {
        var difference = DateTime.now().difference(loan!.dueDate);
        if (difference.inDays < 1) {
          if (difference.inHours < 1) {
            return '${difference.inMinutes} minutes overdue. Return now!';
          } else {
            return '${difference.inHours} hours overdue. Return now!';
          }
        } else {
          return '${difference.inDays} days overdue. Return now!';
        }
      } else {
        return 'Returned';
      }
    }
    return '';
  }

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
    String timeLeft = _setTimeLeft();

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
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                book.author,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                              (loan != null)
                                  ? Text(
                                      timeLeft,
                                      style: TextStyle(
                                        color: (loan!.status.name == 'overdue')
                                            ? Colors.red
                                            : (loan!.status.name == 'active')
                                                ? Theme.of(context)
                                                    .primaryColorLight
                                                : Colors.grey,
                                        fontSize: 14,
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
                            ? (loan!.status.name == 'active')
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Return',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 241, 92, 81),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
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
