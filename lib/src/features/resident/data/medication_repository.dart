import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/medication.dart';

class MedicationRepository {
  static const String baseUrl = "http://10.0.2.2:8093";
  static const String residentsEndpoint = "/api/v1/residents";

  Future<List<Medication>> getMedications(int residentId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medications");
    final response = await http.get(url);

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

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode != 201) {
      throw Exception("Error adding medication: ${response.statusCode}");
    }
  }

  Future<void> deleteMedication(int residentId, int medicationId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medications/$medicationId");
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      throw Exception("Error deleting medication: ${response.statusCode}");
    }
  }
}
