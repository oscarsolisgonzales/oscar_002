import 'dart:io';

import 'package:flutter/material.dart';

class PhotoViewer extends StatelessWidget {
  const PhotoViewer({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.file(
        File(path),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
