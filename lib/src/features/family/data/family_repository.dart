import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/session/session_providers.dart';
import '../../../core/session/session_storage.dart';

import 'dtos/create_family_member_request_dto.dart';


final familyRepositoryProvider = Provider<FamilyRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return FamilyRepository(storage);
});

class FamilyRepository {
  final SessionStorage _storage;
  static const String baseUrl = "http://10.0.2.2:8080";
  static const String familyMemberEndpoint = "/api/v1/family-members";

  FamilyRepository(this._storage);

  Future<void> createFamilyMember(CreateFamilyMemberRequestDto request) async {
    final url = Uri.parse("$baseUrl$familyMemberEndpoint");
    final body = jsonEncode(request.toJson());
    final token = await _storage.getAccessToken();

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
      body: body,
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Error creating family member: ${response.body}");
    }
  }
}
