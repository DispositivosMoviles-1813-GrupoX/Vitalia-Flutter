import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/session/session_storage.dart';
import '../../../core/session/session_providers.dart';
import '../domain/doctor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DoctorRepository {
  final SessionStorage _storage;
  final String? baseUrl = dotenv.env['API_URL'];
  static const String doctorsEndpoint = "/api/v1/doctors";

  DoctorRepository(this._storage);

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getAccessToken();
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<List<Doctor>> getDoctors() async {
    final url = Uri.parse("$baseUrl$doctorsEndpoint");
    final headers = await _getHeaders();
    print("DoctorRepository: GET $url");
    final response = await http.get(url, headers: headers);
    print("DoctorRepository: Response Status: ${response.statusCode}");
    print("DoctorRepository: Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Doctor.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching doctors: ${response.statusCode}");
    }
  }

  Future<Doctor?> getDoctorById(int id) async {
    final url = Uri.parse("$baseUrl$doctorsEndpoint/$id");
    final headers = await _getHeaders();
    print("DoctorRepository: GET $url");
    final response = await http.get(url, headers: headers);
    print("DoctorRepository: Response Status: ${response.statusCode}");
    print("DoctorRepository: Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Doctor.fromJson(json);
    } else {
      throw Exception("Error fetching doctor: ${response.statusCode}");
    }
  }
}

final doctorRepositoryProvider = Provider<DoctorRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return DoctorRepository(storage);
});
