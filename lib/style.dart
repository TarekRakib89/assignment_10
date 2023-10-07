import 'package:flutter/material.dart';

ButtonStyle applyButtonStyle(Size size) {
  return ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, size.height * 0.01),
    backgroundColor: Colors.red,
  );
}

TextStyle applyTextStyle() {
  return const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
