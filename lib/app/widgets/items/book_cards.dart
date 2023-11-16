import 'package:bookpal/app/pages/book_description/book_description_page.dart';
import 'package:bookpal/core/constants/constants.dart';
import 'package:bookpal/core/util/utilities.dart';
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
                        baseColor: Theme.of(context).colorScheme.primaryContainer,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: Colors.transparent,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    }
                    return Image.network(
                      snapshot.data!,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Shimmer.fromColors(
                          baseColor: Theme.of(context).colorScheme.primaryContainer,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.transparent,
                          ),
                        );
                      },
                      fit: BoxFit.cover,
                    );
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
  final String imageUrl;
  final String title;
  final String author;
  final String? timeLeft;
  final bool isFavorite;

  const BookCard2(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.author,
      this.timeLeft,
      required this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
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
                Container(
                  height: 110,
                  padding: const EdgeInsets.only(left: 100),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: (!isFavorite)
                          ? MainAxisAlignment.spaceAround
                          : MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          author,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        (!isFavorite)
                            ? Text(
                                timeLeft!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: (!isFavorite)
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Renew',
                              style: TextStyle(
                                color: Color.fromARGB(255, 241, 92, 81),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
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
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
