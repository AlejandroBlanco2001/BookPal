
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
    return Row(
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const ClipOval(
            child: SizedBox(
              width: 74,
              height: 74,
              child: ThemeShimmer(),
            ),
          ),
          imageBuilder: (context, imageProvider) => Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: CircleAvatar(
              backgroundImage: imageProvider,
              radius: 37,
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
