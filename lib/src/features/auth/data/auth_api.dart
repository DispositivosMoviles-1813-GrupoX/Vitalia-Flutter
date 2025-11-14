import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import './dtos/auth_response_dto.dart';
import './dtos/signup_response_dto.dart';
import 'dtos/signup_request_dto.dart';

final authApiProvider = Provider<AuthApi>((ref) => AuthApi());

class AuthApi {
  static const String baseUrl = "http://10.0.2.2:8093";
  static const String loginEndpoint = "/api/v1/authentication/sign-in";
  static const String signUpEndpoint = "/api/v1/authentication/sign-up";

  Future<AuthResponseDto> signIn({
    required String username,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl$loginEndpoint");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return AuthResponseDto.fromJson(json);
    } else {
      throw Exception("Error al iniciar sesión: ${response.body}");
    }
  }

  Future<SignUpResponseDto> signUp(SignUpRequestDto request) async {
    final url = Uri.parse("$baseUrl$signUpEndpoint");

    final body = jsonEncode(request.toJson());

    debugPrint('SignUp JSON: $body');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return SignUpResponseDto.fromJson(json);
    } else {
      throw Exception("Error al registrarse: ${response.body}");
    }
  }

}
