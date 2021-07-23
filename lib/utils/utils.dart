import 'package:flutter/material.dart';

class Utils {
  static void showSnackBar(
      {required BuildContext context,
      required String text,
      required Color colour}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: colour,
          content: Text(text),
        ),
      );
  }
}
