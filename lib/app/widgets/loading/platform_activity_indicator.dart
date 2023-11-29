import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  const PlatformActivityIndicator({super.key, this.light = true});

  final bool light;

  @override
  Widget build(BuildContext context) {
    Color color = light
        ? Theme.of(context).colorScheme.secondary
        : Theme.of(context).colorScheme.primary;
    return Center(
      child: (defaultTargetPlatform == TargetPlatform.iOS)
          ? CupertinoActivityIndicator(color: color)
          : CircularProgressIndicator(color: color),
    );
  }
}
