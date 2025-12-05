import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/session/session_storage.dart';
import '../domain/medication.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class MedicationRepository {
  final SessionStorage _storage;
  final String? baseUrl = dotenv.env['API_URL'];
  static const String residentsEndpoint = "/api/v1/residents";

  MedicationRepository(this._storage);

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getAccessToken();
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<List<Medication>> getMedications(int residentId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medications");
    final headers = await _getHeaders();
    
    print("MedicationRepository: GET $url");
    print("MedicationRepository: Headers: $headers");

    final response = await http.get(url, headers: headers);

    print("MedicationRepository: Response Status: ${response.statusCode}");
    print("MedicationRepository: Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Medication.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching medications: ${response.statusCode}");
    }
  }

  Future<void> addMedication(int residentId, String name, String frequency) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medications");
    final body = jsonEncode({
      "name": name,
      "frequency": frequency,
    });
    final headers = await _getHeaders();

    print("MedicationRepository: POST $url");
    print("MedicationRepository: Body: $body");

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print("MedicationRepository: Response Status: ${response.statusCode}");
    print("MedicationRepository: Response Body: ${response.body}");

    if (response.statusCode != 201) {
      throw Exception("Error adding medication: ${response.statusCode}");
    }
  }

  Future<void> deleteMedication(int residentId, int medicationId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medications/$medicationId");
    final headers = await _getHeaders();

    print("MedicationRepository: DELETE $url");

    final response = await http.delete(url, headers: headers);

    print("MedicationRepository: Response Status: ${response.statusCode}");
    print("MedicationRepository: Response Body: ${response.body}");

    if (response.statusCode != 204) {
      throw Exception("Error deleting medication: ${response.statusCode}");
    }
  }
}
