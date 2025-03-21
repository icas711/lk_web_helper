import 'package:flutter/material.dart';

mixin SnackBarService {
  static const errorColor = Colors.red;
  static const okColor = Colors.green;

   static Future<void> showSnackBar(
      BuildContext context, String message, [bool? error]) async {
     error??=true;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: error ? errorColor : okColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
