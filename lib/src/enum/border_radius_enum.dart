import 'package:flutter/material.dart';

enum BorderRadiusEnum {
  all(border: BorderRadius.all(Radius.circular(8.0))),
  top(
      border: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))),
  bottom(
      border: BorderRadius.only(
          bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)));

  final BorderRadiusGeometry border;
  const BorderRadiusEnum({required this.border});
}