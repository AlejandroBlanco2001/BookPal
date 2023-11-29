import 'package:bookpal/app/widgets/loading/basic_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) {
        return const ThemeShimmer();
      },
      fit: BoxFit.cover,
    );
  }
}
