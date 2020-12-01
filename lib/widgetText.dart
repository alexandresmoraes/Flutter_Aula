import 'package:flutter/material.dart';

Center widgetText() {
  return Center(
    child: Text(
      "Widget text",
      style: TextStyle(
        fontSize: 40,
        color: Colors.orange,
        decoration: TextDecoration.underline,
        decorationColor: Colors.blue,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    ),
  );
}
