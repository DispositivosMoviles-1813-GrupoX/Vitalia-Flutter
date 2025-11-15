import 'package:http/http.dart' as http;
import 'dart:convert';

import '../domain/resident.dart';

class ResidentRepository {
  final http.Client _client;

  ResidentRepository(this._client);

  Future<Resident> fetchResident(String userId) async {

    final url = Uri.parse("http://localhost:8080/api/residents/$userId");

    final response = await _client.get(url);

    if (response.statusCode != 200) {
      throw Exception("Error al obtener los datos del residente");
    }

    final jsonData = jsonDecode(response.body);
    return Resident.fromJson(jsonData);
  }
}
