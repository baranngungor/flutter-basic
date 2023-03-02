import 'dart:convert';
import 'package:http/http.dart';
import 'package:userapp/models/response/response_model.dart';

class NetworkService {
  static NetworkService instance = NetworkService._init();
  static Client? _client;
  factory NetworkService() {
    _client ??= Client();
    return instance;
  }

  NetworkService._init() {
    _client ??= Client();
  }

  Future postMethod(url, body) async {
    print(url);
    print(body);
    final uri = Uri.parse(url);
    var response = await _client!
        .post(
      uri,
      headers: {'Content-Type': "application/json"},
      body: json.encode(body),
    )
        .then((value) async {
      var result;
      try {
        result = json.decode(utf8.decode(value.bodyBytes));
      } catch (e) {
        print(
            '$url Endpointine $body bodysi gönderilerek yapılan işlem hatalı.');
        return 'Bir hata oluştu';
      }
      try {
        return ResponseModel.fromJson(result);
      } catch (e) {
        return 'Bir hata oluştu';
      }
    }).onError((error, stackTrace) => Future.error(error.toString()));
    return response;
  }
}
