import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/match.dart';
import 'package:flutter_aula1/widgetImage.dart';

import 'api.dart';

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
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var matches = new List<Match>();

  _getMatches() {
    API.getMatches().then((response) {
      setState(() {
        Iterable lista = json.decode(response.body);
        matches = lista
            .map((model) => Match.fromJson(model))
            .where((match) => match.team1 != null && match.team2 != null)
            .toList();
      });
    });
  }

  _BuildListViewState() {
    _getMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Matches'),
      ),
      body: listaDeMatches(),
    );
  }

  listaDeMatches() {
    return ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return WidgetImage(
            match: matches[index],
          );
        });
  }
}
