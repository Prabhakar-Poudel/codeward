import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';

Icon buildIcon({required String issuer, required double size}) {
  final iconData =
      SimpleIcons.values[issuer.toLowerCase()] ?? Icons.question_mark;

  return Icon(
    iconData,
    size: size,
  );
}
