import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/session/session_storage.dart';
import '../domain/medical_history.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MedicalHistoryRepository {
  final SessionStorage _storage;
  final String? baseUrl = dotenv.env['API_URL'];
  static const String residentsEndpoint = "/api/v1/residents";

  MedicalHistoryRepository(this._storage);

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getAccessToken();
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<List<MedicalHistory>> getMedicalHistories(int residentId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medical-histories");
    final headers = await _getHeaders();
    print("MedicalHistoryRepository: GET $url");
    print("MedicalHistoryRepository: Headers: $headers");
    
    final response = await http.get(url, headers: headers);

    print("MedicalHistoryRepository: Response Status: ${response.statusCode}");
    print("MedicalHistoryRepository: Response Body: ${response.body}");

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
    final headers = await _getHeaders();

    print("MedicalHistoryRepository: POST $url");
    print("MedicalHistoryRepository: Body: $body");

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print("MedicalHistoryRepository: Response Status: ${response.statusCode}");
    print("MedicalHistoryRepository: Response Body: ${response.body}");

    if (response.statusCode != 201) {
      throw Exception("Error adding medical history: ${response.statusCode}");
    }
  }

  Future<void> deleteMedicalHistory(int residentId, int medicalHistoryId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/medical-histories/$medicalHistoryId");
    final headers = await _getHeaders();
    
    print("MedicalHistoryRepository: DELETE $url");

    final response = await http.delete(url, headers: headers);

    print("MedicalHistoryRepository: Response Status: ${response.statusCode}");
    print("MedicalHistoryRepository: Response Body: ${response.body}");

    if (response.statusCode != 204) {
      throw Exception("Error deleting medical history: ${response.statusCode}");
    }
  }
}
