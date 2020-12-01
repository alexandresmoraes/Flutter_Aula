import 'package:flutter/material.dart';

widgetButton() {
  return RaisedButton(
    color: Colors.red,
    elevation: 20,
    textColor: Colors.white,
    child: Text("OK"),
    onPressed: () => exebirTexto('Pressionado'),
  );
}

void exebirTexto(String message) {
  print(message);
}
