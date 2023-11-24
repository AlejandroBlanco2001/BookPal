import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:bookpal/core/util/utilities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String status;

  const BookItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.author,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double coverWidth = MediaQuery.of(context).size.width * 0.155;
    double coverHeight = coverWidth * (4 / 3);
    return Row(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: SizedBox(
              width: coverWidth,
              height: coverHeight,
              child: const ThemeShimmer(),
            ),
          ),
          imageBuilder: (context, imageProvider) => Container(
            width: coverWidth,
            height: coverHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                author,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 4,
              ),
              Divider(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(.5),
              ),
              Text(
                Utilities.capitalize(status),
                style: TextStyle(
                    color: (status == 'available') ? Colors.green : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ],
    );
  }
}
