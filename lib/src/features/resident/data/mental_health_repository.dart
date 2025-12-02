import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/session/session_storage.dart';
import '../domain/mental_health_record.dart';

class MentalHealthRepository {
  final SessionStorage _storage;
  static const String baseUrl = "http://10.0.2.2:8080";
  static const String residentsEndpoint = "/api/v1/residents";

  MentalHealthRepository(this._storage);

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getAccessToken();
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<List<MentalHealthRecord>> getMentalHealthRecords(int residentId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/mental-health-records");
    final headers = await _getHeaders();

    print("MentalHealthRepository: GET $url");
    print("MentalHealthRepository: Headers: $headers");

    final response = await http.get(url, headers: headers);

    print("MentalHealthRepository: Response Status: ${response.statusCode}");
    print("MentalHealthRepository: Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => MentalHealthRecord.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching mental health records: ${response.statusCode}");
    }
  }

  Future<void> addMentalHealthRecord(int residentId, String diagnosis, String treatment) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/mental-health-records");
    final body = jsonEncode({
      "diagnosis": diagnosis,
      "treatment": treatment,
    });
    final headers = await _getHeaders();

    print("MentalHealthRepository: POST $url");
    print("MentalHealthRepository: Body: $body");

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print("MentalHealthRepository: Response Status: ${response.statusCode}");
    print("MentalHealthRepository: Response Body: ${response.body}");

    if (response.statusCode != 201) {
      throw Exception("Error adding mental health record: ${response.statusCode}");
    }
  }

  Future<void> deleteMentalHealthRecord(int residentId, int recordId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/mental-health-records/$recordId");
    final headers = await _getHeaders();

    print("MentalHealthRepository: DELETE $url");

    final response = await http.delete(url, headers: headers);

    print("MentalHealthRepository: Response Status: ${response.statusCode}");
    print("MentalHealthRepository: Response Body: ${response.body}");

    if (response.statusCode != 204) {
      throw Exception("Error deleting mental health record: ${response.statusCode}");
    }
  }
}
