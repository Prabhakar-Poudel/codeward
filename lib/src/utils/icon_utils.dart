import 'package:flutter/material.dart';

Icon buildIcon({required int codePoint, required double size}) {
  if (codePoint == 123456789) {
    return Icon(
      Icons.question_mark,
      size: size,
    );
  }
  return Icon(
    IconData(
      codePoint,
      fontFamily: 'SimpleIcons',
      fontPackage: 'simple_icons',
    ),
    size: size,
  );
}
