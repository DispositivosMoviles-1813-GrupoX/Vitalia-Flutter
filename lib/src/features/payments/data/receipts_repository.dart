import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/session/session_storage.dart';
import '../../../core/session/session_providers.dart';
import '../domain/receipt.dart';
import 'dtos/create_receipt_request_dto.dart';


class ReceiptsRepository {
  final SessionStorage _storage;
  static const String baseUrl = 'http://10.0.2.2:8080';
  static const String receiptsEndpoint = "/api/v1/receipts";  ReceiptsRepository(this._storage) {
    if (baseUrl == null) {
      throw Exception("API_URL not found in .env file");
    }
  }

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getAccessToken();

    if (token == null) {
      throw Exception(
          "Sesión expirada. Por favor cierra sesión y vuelve a entrar.");
    }

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

// GET /api/v1/receipts/{residentId}
  Future<List<Receipt>> getReceiptsByResident(int residentId) async {
    final url = Uri.parse("$baseUrl$receiptsEndpoint/$residentId");
    final headers = await _getHeaders();

    final response = await http.get(url, headers: headers);

    // ✅ Caso éxito normal
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList
          .map((json) => Receipt.fromJson(json as Map<String, dynamic>))
          .toList();
    }

    // ✅ Caso "no hay recibos" → tratamos como lista vacía
    if (response.statusCode == 404 || response.statusCode == 204) {
      return <Receipt>[];
    }

    // ❌ Sesión expirada
    if (response.statusCode == 401) {
      throw Exception(
          "Sesión expirada. Por favor, inicia sesión nuevamente.");
    }

    // ❌ Otros errores reales
    throw Exception(
        "Error obteniendo recibos: ${response.statusCode} - ${response.body}");
  }


  // GET /api/v1/receipts/searchByReceiptId?receiptId=...
  Future<Receipt?> getReceiptById(int receiptId) async {
    final url = Uri.parse(
        "$baseUrl$receiptsEndpoint/searchByReceiptId?receiptId=$receiptId");
    final headers = await _getHeaders();

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 404) return null;

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return Receipt.fromJson(jsonMap);
    } else if (response.statusCode == 401) {
      throw Exception(
          "Sesión expirada. Por favor, inicia sesión nuevamente.");
    } else {
      throw Exception(
          "Error obteniendo recibo: ${response.statusCode} - ${response.body}");
    }
  }

  // POST /api/v1/receipts
  Future<Receipt> createReceipt(CreateReceiptRequestDto dto) async {
    final url = Uri.parse("$baseUrl$receiptsEndpoint");
    final headers = await _getHeaders();
    final body = jsonEncode(dto.toJson());

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return Receipt.fromJson(jsonMap);
    } else if (response.statusCode == 401) {
      throw Exception(
          "Sesión expirada. Por favor, inicia sesión nuevamente.");
    } else {
      throw Exception(
          "Error creando recibo: ${response.statusCode} - ${response.body}");
    }
  }

  // PUT /api/v1/receipts/{receiptId}
  Future<Receipt> updateReceipt(
      int receiptId,
      CreateReceiptRequestDto dto,
      ) async {
    final url = Uri.parse("$baseUrl$receiptsEndpoint/$receiptId");
    final headers = await _getHeaders();
    final body = jsonEncode(dto.toJson());

    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonMap = jsonDecode(response.body);
      return Receipt.fromJson(jsonMap);
    } else if (response.statusCode == 401) {
      throw Exception(
          "Sesión expirada. Por favor, inicia sesión nuevamente.");
    } else {
      throw Exception(
          "Error actualizando recibo: ${response.statusCode} - ${response.body}");
    }
  }

  // DELETE /api/v1/receipts/{receiptId}
  Future<void> deleteReceipt(int receiptId) async {
    final url = Uri.parse("$baseUrl$receiptsEndpoint/$receiptId");
    final headers = await _getHeaders();

    final response = await http.delete(url, headers: headers);

    if (response.statusCode == 200 || response.statusCode == 204) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception(
          "Sesión expirada. Por favor, inicia sesión nuevamente.");
    } else {
      throw Exception(
          "Error eliminando recibo: ${response.statusCode} - ${response.body}");
    }
  }
}

// Provider al estilo de AppointmentRepository
final receiptsRepositoryProvider = Provider<ReceiptsRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return ReceiptsRepository(storage);
});
