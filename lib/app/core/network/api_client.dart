import 'dart:convert';

import 'package:alborada_demo/app/core/core.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient(this.baseUrl);
  final String baseUrl;

  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    Logger.info('GET request: $url');
    try {
      final response = await http.get(url, headers: headers);
      Logger.log('Response for GET $endpoint: ${response.body}');
      return _processResponse(response);
    } catch (e) {
      Logger.error('Error during GET $endpoint: $e');
      rethrow;
    }
  }

  Future<dynamic> post(String endpoint,
      {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    Logger.info('POST request: $url with body: $body');
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      Logger.error('Error during POST $endpoint: $e');
      rethrow;
    }
  }

  dynamic _processResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Error: ${response.statusCode}, ${response.body}');
    }
  }
}
