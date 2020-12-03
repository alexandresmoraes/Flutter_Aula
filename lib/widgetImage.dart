import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/match.dart';

class WidgetImage extends StatelessWidget {
  final Match match;
  WidgetImage({this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => {
          print('pressionado'),
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.network(
                      'https://img-cdn.hltv.org/teamlogo/D76Tko1piL7Ny_y7ZCqHQJ.png?ixlib=java-2.1.0&w=50&s=945bdc2894340b134a950ad484e7150c'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        match?.event?.name ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'VS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                      Text(match?.id?.toString() ?? ""),
                    ],
                  ),
                  Image.asset(
                    'imagens/furia.png',
                    height: 60,
                    width: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
