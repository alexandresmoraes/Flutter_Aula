import 'package:http/http.dart' as http;

const baseUrl = 'http://192.168.2.211:8000';

class API {
  static Future getMatches() async {
    var url = baseUrl + '/matches';
    return await http.get(url);
  }
}
