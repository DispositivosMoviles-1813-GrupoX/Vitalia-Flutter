import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/session/session_storage.dart';
import '../domain/resident.dart';
import 'dtos/create_resident_request_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dtos/update_resident_request_dto.dart';

class ResidentRepository {
  final SessionStorage _storage;
  final String? baseUrl = dotenv.env['API_URL'];
  static const String residentsEndpoint = "/api/v1/residents";

  ResidentRepository(this._storage);

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getAccessToken();
    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  Future<Resident> getResidentById(int id) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$id");
    final headers = await _getHeaders();
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print("ResidentRepository: JSON Response: ${response.body}");
      final json = jsonDecode(response.body);
      return Resident.fromJson(json);
    } else {
      throw Exception("Error fetching resident: ${response.statusCode}");
    }
  }

  Future<Resident> getResidentDetails(int id) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$id/details");
    final headers = await _getHeaders();
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Resident.fromJson(json);
    } else {
      throw Exception("Error fetching resident details: ${response.statusCode}");
    }
  }

  Future<List<Resident>> getAllResidents() async {
    final url = Uri.parse("$baseUrl$residentsEndpoint");
    final headers = await _getHeaders();
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Resident.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching residents: ${response.statusCode}");
    }
  }
  Future<Resident> createResident(CreateResidentRequestDto request) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint");
    final body = jsonEncode(request.toJson());
    final headers = await _getHeaders();

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return Resident.fromJson(json);
    } else {
      throw Exception("Error creating resident: ${response.body}");
    }
  }

  Future<Resident> updateResident(int id, UpdateResidentRequestDto residentDto) async {
    final url = Uri.parse("$baseUrl$residentsEndpoint/$id");
    final headers = await _getHeaders();
    final body = jsonEncode(residentDto.toJson());

    print("ResidentRepository: PUT $url");
    print("ResidentRepository: Body: $body");

    final response = await http.put(url, headers: headers, body: body);
    print("ResidentRepository: Response Status: ${response.statusCode}");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Resident.fromJson(json);
    } else {
      throw Exception("Error updating resident: ${response.body}");
    }
  }
}

