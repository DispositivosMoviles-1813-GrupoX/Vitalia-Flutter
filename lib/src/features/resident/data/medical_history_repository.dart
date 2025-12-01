import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/medical_history.dart';

class MedicalHistoryRepository {
  static const String baseUrl = "http://10.0.2.2:8080";
  static const String residentsEndpoint = "/api/v1/residents";

  Future<List<MedicalHistory>> getMedicalHistories(int residentId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medical-histories");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => MedicalHistory.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching medical histories: ${response.statusCode}");
    }
  }

  Future<void> addMedicalHistory(int residentId, String diagnosis, String treatment) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medical-histories");
    final body = jsonEncode({
      "diagnosis": diagnosis,
      "treatment": treatment,
    });

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode != 201) {
      throw Exception("Error adding medical history: ${response.statusCode}");
    }
  }

  Future<void> deleteMedicalHistory(int residentId, int medicalHistoryId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medical-histories/$medicalHistoryId");
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      throw Exception("Error deleting medical history: ${response.statusCode}");
    }
  }
}
