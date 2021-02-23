import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'package:marvel_app/domain/models/app_error.dart';
import 'package:marvel_app/domain/services/http_service.dart';

class HttpHttpService extends HttpService {
  static const apiKey = '7a881dcb8a429a3119fb29aab37b2449';
  static const privateApiKey = 'acfeda8a205f24175d0cf752016d59c02c4ea7b7';
  static const endpoint = 'https://gateway.marvel.com:443/v1/public';

  @override
  Future<dynamic> getMethod(String path, String queryParams) async {
    final ts = DateTime.now().toIso8601String();
    final dataToHash = ts + privateApiKey + apiKey;
    var bytes = utf8.encode(dataToHash); // data being hashed
    var digest = md5.convert(bytes);

    try {
      final response = await http.get('$endpoint$path?$queryParams&ts=$ts&apikey=$apiKey&hash=$digest');

      final rawResponse = json.decode(response.body);

      return rawResponse;
    } on SocketException catch (e) {
      throw AppError(code: 'connection-error', message: e.message);
    } catch (e) {
      print(e);
      throw AppError(code: 'generic-error', message: 'An error occur');
    }
  }
}
