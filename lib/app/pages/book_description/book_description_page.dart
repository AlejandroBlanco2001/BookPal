import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:bookpal/app/widgets/loading/shimmer_image.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:flutter/material.dart';

class BookDescription extends StatelessWidget {
  const BookDescription({super.key, required this.book});

  final PhysicalBookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FutureBuilder(
                    future: Utilities.getDownloadUrl(
                        '$booksCoversPath${book.bookCover}'),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return _buildBookCover(const ThemeShimmer());
                      } else if (snapshot.hasError) {
                        return _buildBookCover(const Icon(Icons.error_outline));
                      }
                      return _buildBookCover(ShimmerImage(url: snapshot.data!));
                    },
                  ),
                  Expanded(
                    child: Container(
                      width: 200,
                      height: 150,
                      margin: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'The Midnight Library',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            child: const Text(
                              'By Matt Haig',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.only(right: 2.0),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 2.0),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 2.0),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 2.0),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 2.0),
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 4.0),
                                  child: const Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 8.0),
                                  child: const Text(
                                    '(1.2k)',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            child: const Text(
                              '3 books in library',
                              style: TextStyle(
                                color: Colors.grey,
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
          ],
        ),
      ),
    );
  }

  _buildBookCover(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        width: 140,
        height: 200,
        child: child,
      ),
    );
  }
}
