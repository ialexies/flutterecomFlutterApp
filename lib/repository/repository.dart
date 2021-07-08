import 'package:http/http.dart' as http;

class Repository {
  // String _baseUrl = 'https://flutterecom.com/api/';
  String _baseUrl = 'http://192.168.100.68/flutterecom/public/api';

  httpGet(String api) async {
    return await http.get(_baseUrl + "/" + api);
  }

  httpGetById(String api, categoryId) async {
    return await http.get(_baseUrl + "/" + api + "/" + categoryId.toString());
  }
}
