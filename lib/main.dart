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
        //height: double.infinity,
        //width: double.infinity,
        color: Colors.white,
        child: widgetImage(),
      ),
    );
  }

  widgetImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.network(
            'https://img-cdn.hltv.org/teamlogo/D76Tko1piL7Ny_y7ZCqHQJ.png?ixlib=java-2.1.0&w=50&s=945bdc2894340b134a950ad484e7150c'),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('12:45'),
            Text(
              'VS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.red,
              ),
            ),
            Text('1/12/2020')
          ],
        ),
        Image.network(
            'https://img-cdn.hltv.org/teamlogo/7b6DouMNGWcqENDx1vw_Ot.png?ixlib=java-2.1.0&w=50&s=5ffc85bfbc0398d0a826590a790a08a6'),
      ],
    );
  }
}
