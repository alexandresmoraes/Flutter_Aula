import 'package:flutter/material.dart';
import 'package:flutter_aula1/widgetImage.dart';

class WidgetListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          WidgetImage(),
          Divider(),
          WidgetImage(),
          Divider(),
          WidgetImage(),
          Divider(),
        ],
      ),
    );
  }
}
