import 'package:bookpal/app/pages/book_description/book_description_page.dart';
import 'package:bookpal/app/widgets/home_page/book_item.dart';
import 'package:bookpal/app/widgets/loading/platform_activity_indicator.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:bookpal/data/models/physical_book_model.dart';
import 'package:flutter/material.dart';

class BookRow extends StatelessWidget {
  const BookRow({Key? key, required this.book}) : super(key: key);

  final PhysicalBookModel book;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDescription(book: book),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 6.0, 24, 6),
          child: Ink(
            child: FutureBuilder(
              future: Utilities.getDownloadUrl('$booksCoversPath${book.bookCover}'),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  return const PlatformActivityIndicator();
                } else if (snapshot.hasError) {
                  logger.d("Error loading book cover of ${book.title}. Error: ${snapshot.error}");
                  return const Icon(Icons.error);
                }
                return BookItem(
                  imageUrl: snapshot.data!,
                  title: book.title,
                  author: book.author,
                  status: book.status.name,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
