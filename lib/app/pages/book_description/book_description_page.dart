import 'package:bookpal/app/widgets/book_description/book_synopsis.dart';
import 'package:bookpal/app/widgets/book_description/borrow_button.dart';
import 'package:bookpal/app/widgets/book_description/rating_menu.dart';
import 'package:bookpal/app/widgets/book_description/ratings_row.dart';
import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:bookpal/app/widgets/loading/shimmer_image.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.book, this.scanned = false});

  final PhysicalBookModel book;
  final bool scanned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: (scanned) ? BorrowButton(book: book) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            size: 32,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        title: Text(
          'Book description',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder(
                      future: Utilities.getDownloadUrl(
                          '$booksCoversPath${book.bookCover}'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return _buildBookCover(context, const ThemeShimmer());
                        } else if (snapshot.hasError) {
                          return _buildBookCover(
                              context, const Icon(Icons.error_outline));
                        }
                        return _buildBookCover(
                            context, ShimmerImage(url: snapshot.data!));
                      },
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.525,
                        margin: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              book.title,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              child: Text(
                                'By ${book.author}',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            RatingsRow(book: book),
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              child: Text(
                                '${book.available!} book${(book.available! > 1) ? 's' : ''} in library',
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const BookSynopsis(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: RatingMenu(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildBookCover(BuildContext context, Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.width * 0.525,
        child: child,
      ),
    );
  }
}
