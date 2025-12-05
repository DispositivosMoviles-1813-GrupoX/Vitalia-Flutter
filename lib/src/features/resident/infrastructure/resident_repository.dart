import 'package:http/http.dart' as http;
import 'dart:convert';

import '../domain/resident.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../../core/session/session_storage.dart';

class ResidentRepository {
  final http.Client _client;
  final SessionStorage _storage;
  final String? baseUrl = dotenv.env['API_URL'];
  ResidentRepository(this._client, this._storage);

  Future<Resident> fetchResident(String userId) async {
    final url = Uri.parse("$baseUrl/api/residents/$userId");
    final token = await _storage.getAccessToken();

    final response = await _client.get(
      url,
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      throw Exception("Error al obtener los datos del residente");
    }

    final jsonData = jsonDecode(response.body);
    return Resident.fromJson(jsonData);
  }
}
