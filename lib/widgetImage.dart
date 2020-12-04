import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/match.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image/image.dart' as Images;
//import 'package:image/image.dart';

class WidgetImage extends StatefulWidget {
  final Match match;

  WidgetImage({this.match});

  @override
  _WidgetImageState createState() => _WidgetImageState();
}

class _WidgetImageState extends State<WidgetImage> {
  bool isTeam1Svg;
  bool isTeam2Svg;
  bool isLoading1 = true;
  bool isLoading2 = true;
  Uint8List team1Logo;
  Uint8List team2Logo;

  Future<Uint8List> httpGet(String url, {Map<String, String> headers}) async {
    final HttpClient httpClient = HttpClient();
    final Uri uri = Uri.base.resolve(url);
    final HttpClientRequest request = await httpClient.getUrl(uri);
    if (headers != null) {
      headers.forEach((String key, String value) {
        request.headers.add(key, value);
      });
    }
    final HttpClientResponse response = await request.close();

    if (response.statusCode != HttpStatus.ok) {
      throw HttpException('Could not get network asset', uri: uri);
    }
    return consolidateHttpClientResponseBytes(response);
  }

  @override
  initState() {
    super.initState();

    Images.PngDecoder png = Images.PngDecoder();
    Images.JpegDecoder jpg = Images.JpegDecoder();
    httpGet(widget.match.team1.logo).then((value) => {
          setState(() {
            isLoading1 = false;
            isTeam1Svg = !(png.isValidFile(value) || jpg.isValidFile(value));
            team1Logo = value;
          })
        });
    httpGet(widget.match.team2.logo).then((value) => {
          setState(() {
            isLoading2 = false;
            isTeam2Svg = !(png.isValidFile(value) || jpg.isValidFile(value));
            team2Logo = value;
          })
        });
  }

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
                  Column(
                    children: [
                      isLoading1
                          ? CircularProgressIndicator()
                          : isTeam1Svg
                              ? SvgPicture.memory(
                                  team1Logo,
                                  width: 50,
                                  height: 50,
                                )
                              : Image.memory(
                                  team1Logo,
                                  width: 50,
                                  height: 50,
                                ),
                      Text(
                        widget.match.team1.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.match?.event?.name ?? "",
                        overflow: TextOverflow.ellipsis,
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
                      Text(widget.match?.id?.toString() ?? ""),
                    ],
                  ),
                  Column(
                    children: [
                      isLoading2
                          ? CircularProgressIndicator()
                          : isTeam2Svg
                              ? SvgPicture.memory(
                                  team2Logo,
                                  width: 50,
                                  height: 50,
                                )
                              : Image.memory(
                                  team2Logo,
                                  width: 50,
                                  height: 50,
                                ),
                      Text(
                        widget.match.team2.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
