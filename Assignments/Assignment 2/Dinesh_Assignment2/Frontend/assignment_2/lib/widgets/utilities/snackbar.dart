import 'package:flutter/material.dart';

void snackbar(BuildContext context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
    ),
    //margin: EdgeInsets.only(right: 40, left: 40),
  ));
}
