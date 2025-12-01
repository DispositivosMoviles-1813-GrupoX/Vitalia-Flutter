import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/mental_health_record.dart';

class MentalHealthRepository {
  static const String baseUrl = "http://10.0.2.2:8093";
  static const String residentsEndpoint = "/api/v1/residents";

  Future<List<MentalHealthRecord>> getMentalHealthRecords(int residentId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/mental-health-records");
    final response = await http.get(url);

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

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode != 201) {
      throw Exception("Error adding mental health record: ${response.statusCode}");
    }
  }

  Future<void> deleteMentalHealthRecord(int residentId, int recordId) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$residentId/mental-health-records/$recordId");
    final response = await http.delete(url);

    if (response.statusCode != 204) {
      throw Exception("Error deleting mental health record: ${response.statusCode}");
    }
  }
}
