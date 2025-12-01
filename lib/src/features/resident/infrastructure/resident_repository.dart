import 'package:http/http.dart' as http;
import 'dart:convert';

import '../domain/resident.dart';

import '../../../core/session/session_storage.dart';

class ResidentRepository {
  final http.Client _client;
  final SessionStorage _storage;

  ResidentRepository(this._client, this._storage);

  Future<Resident> fetchResident(String userId) async {
    final url = Uri.parse("http://10.0.2.2:8080/api/residents/$userId");
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
