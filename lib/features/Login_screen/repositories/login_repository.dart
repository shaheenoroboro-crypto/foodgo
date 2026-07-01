import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/api/api_client.dart';
import '../models/login_response.dart';

class LoginRepository {
  final ApiClient _apiClient;

  LoginRepository({ApiClient? apiClient})
    : _apiClient = apiClient ?? ApiClient();

  Future<LoginResponse> loginuser(String email, String passwords) async {
    String endpoint = "${dotenv.env["basepath"]}login/";

    final response = await _apiClient.post(
      endpoint,
      body: {'email': email, 'password': passwords},
    );

    final loginResponse = LoginResponse.fromJson(response);

    // Save tokens locally
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', loginResponse.access ?? '');
    await prefs.setString('refresh_token', loginResponse.refresh ?? '');

    return loginResponse;
  }
}
