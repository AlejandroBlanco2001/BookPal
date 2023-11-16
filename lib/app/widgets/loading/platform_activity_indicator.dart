import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  const PlatformActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (defaultTargetPlatform == TargetPlatform.iOS)
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }
}
