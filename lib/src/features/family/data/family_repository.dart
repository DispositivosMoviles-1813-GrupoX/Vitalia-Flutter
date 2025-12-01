// Archivo: features/family/data/family_repository.dart

import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../../core/session/session_providers.dart';
import '../../../core/session/session_storage.dart';
import './domain/family_member.dart';
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

  Future<FamilyMember> createFamilyMember(CreateFamilyMemberRequestDto request) async {
    // ... (Tu código de create existente, déjalo igual) ...
    // Solo para referencia rápida:
    final url = Uri.parse("$baseUrl$familyMemberEndpoint");
    final body = jsonEncode(request.toJson());
    final token = await _storage.getAccessToken();
    final response = await http.post(
        url,
        headers: {"Content-Type": "application/json", if(token!=null) "Authorization": "Bearer $token"},
        body: body
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return FamilyMember.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error create: ${response.body}");
    }
  }

  /// VERSIÓN MEJORADA Y ROBUSTA
  Future<FamilyMember?> getFamilyMemberByUserId(int userId) async {
    final url = Uri.parse("$baseUrl$familyMemberEndpoint"); // Quitamos el query param por ahora para probar fuerza bruta
    final token = await _storage.getAccessToken();

    print("🔍 Buscando familiar para UserID: $userId en $url");

    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
      );

      print("📡 Respuesta Backend Status: ${response.statusCode}");
      print("📡 Respuesta Backend Body: ${response.body}");

      if (response.statusCode == 200) {
        final dynamic json = jsonDecode(response.body);

        // CASO 1: El backend devuelve una LISTA (Array)
        if (json is List) {
          print("✅ El backend devolvió una LISTA de ${json.length} elementos.");

          // Buscamos manualmente en la lista el que tenga el userId correcto
          final match = json.firstWhere(
                (element) {
              // Manejamos si userId viene como int directo o como objeto {"value": 9}
              final elemUserId = element['userId'];
              if (elemUserId is int) return elemUserId == userId;
              if (elemUserId is Map) return elemUserId['value'] == userId;
              return false;
            },
            orElse: () => null,
          );

          if (match != null) {
            print("🎉 ¡Encontrado en la lista! ID Familiar: ${match['id']}");
            return FamilyMember.fromJson(match);
          } else {
            print("⚠️ No se encontró coincidencia para userId $userId en la lista.");
            return null;
          }
        }
        // CASO 2: El backend devuelve un OBJETO único
        else if (json is Map<String, dynamic>) {
          // Verificamos si es el correcto (por si acaso el backend ignoró el filtro)
          // Aquí usamos la lógica de tu DTO
          final member = FamilyMember.fromJson(json);
          if (member.userId == userId) {
            print("🎉 ¡Objeto único coincide!");
            return member;
          }
        }

        return null;
      } else {
        print("❌ Error HTTP: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("💥 EXCEPCIÓN CRÍTICA EN REPOSITORIO: $e");
      return null;
    }
  }
}