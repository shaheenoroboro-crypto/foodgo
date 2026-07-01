import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api_exceptions.dart';

class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? _createDefaultClient();

  static http.Client _createDefaultClient() {
    final ioClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return IOClient(ioClient);
  }

  Future<dynamic> post(String url, {Map<String, String>? headers, dynamic body}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_token');

      final requestHeaders = headers ?? {'Content-Type': 'application/json'};
      if (token != null && token.isNotEmpty) {
        requestHeaders['Authorization'] = 'Bearer $token';
      }

      final response = await _client.post(
        Uri.parse(url),
        headers: requestHeaders,
        body: jsonEncode(body),
      );

      return _processResponse(response);
    } catch (e) {
      if (e is ApiException) rethrow;
      throw ApiException('Failed to connect to the server: $e');
    }
  }

  dynamic _processResponse(http.Response response) {
    var responseBody;
    try {
      responseBody = response.body.isNotEmpty ? jsonDecode(response.body) : null;
    } catch (e) {
      responseBody = response.body;
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    }

    final message = (responseBody is Map && responseBody.containsKey('detail')) 
        ? responseBody['detail'].toString()
        : (responseBody is Map && responseBody.containsKey('error'))
            ? responseBody['error'].toString()
            : 'An error occurred';

    switch (response.statusCode) {
      case 400:
        throw BadRequestException(message, statusCode: response.statusCode);
      case 401:
      case 403:
        throw UnauthorizedException(message, statusCode: response.statusCode);
      case 500:
      default:
        throw ServerException(message, statusCode: response.statusCode);
    }
  }
}
