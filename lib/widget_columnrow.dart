import 'package:flutter/material.dart';
import 'package:flutter_aula1/widget_raisedbutton.dart';

widgetRowColumn() {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      widgetButton(),
      widgetButton(),
      widgetButton(),
    ],
  );
}
