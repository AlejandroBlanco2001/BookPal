import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  const PlatformActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (defaultTargetPlatform == TargetPlatform.iOS)
          ? CupertinoActivityIndicator(color: Theme.of(context).colorScheme.secondary,)
          : CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,),
    );
  }
}
