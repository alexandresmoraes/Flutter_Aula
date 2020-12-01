import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Aula 1",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: WidgetsBasicos(),
    );
  }
}

class WidgetsBasicos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets Basicos"),
      ),
      body: Container(
        color: Colors.white,
        child: widgetButton(),
      ),
    );
  }

  widgetButton() {
    var raisedButton = RaisedButton(
      color: Colors.orange,
      elevation: 30,
      textColor: Colors.white,
      child: Text("Clickme"),
      onPressed: () => exebirTexto('Pressionado'),
    );
    return Center(
      child: raisedButton,
    );
  }

  void exebirTexto(String message) {
    print(message);
  }
}
