import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/session/session_storage.dart';
import '../../../core/session/session_providers.dart';
import '../domain/appointment.dart';
import 'dtos/create_appointment_request_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppointmentRepository {

  final SessionStorage _storage;
  final String? baseUrl = dotenv.env['API_URL'];
  static const String appointmentsEndpoint = "/api/v1/appointments";

  AppointmentRepository(this._storage) {
    if (baseUrl == null) throw Exception("API_URL not found in .env file");
  }

  Future<Map<String, String>> _getHeaders() async {
    final token = await _storage.getAccessToken();
    print("🔐 Token en memoria para Citas: ${token != null ? 'OK' : 'NULL'}");
    if (token != null) {
      print("🔐 Token prefix: ${token.substring(0, 10)}...");
    }

    if (token == null) {
      // Esto detiene la app antes de llamar al servidor inútilmente
      throw Exception("Sesión expirada. Por favor cierra sesión y vuelve a entrar.");
    }

    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
  }

  Future<List<Appointment>> getAppointments() async {
    final url = Uri.parse("$baseUrl$appointmentsEndpoint");
    final headers = await _getHeaders();
    print("AppointmentRepository: GET $url");
    final response = await http.get(url, headers: headers);
    print("AppointmentRepository: Response Status: ${response.statusCode}");
    print("AppointmentRepository: Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Appointment.fromJson(json)).toList();
    } else {
      throw Exception("Error fetching appointments: ${response.statusCode}");
    }
  }

  Future<List<Appointment>> getAppointmentsByResidentId(int residentId) async {
    final url = Uri.parse("$baseUrl$appointmentsEndpoint/searchByResidentId?residentId=$residentId");
    final headers = await _getHeaders();
    print("AppointmentRepository: GET $url");
    final response = await http.get(url, headers: headers);
    print("AppointmentRepository: Response Status: ${response.statusCode}");
    print("AppointmentRepository: Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Appointment.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      // If no appointments found, return empty list instead of throwing error
      return [];
    } else {
      throw Exception("Error fetching appointments for resident $residentId: ${response.statusCode}");
    }
  }

  Future<Appointment?> getAppointmentById(int id) async {
    final url = Uri.parse("$baseUrl$appointmentsEndpoint/$id");
    final headers = await _getHeaders();
    print("AppointmentRepository: GET $url");
    final response = await http.get(url, headers: headers);
    print("AppointmentRepository: Response Status: ${response.statusCode}");
    print("AppointmentRepository: Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Appointment.fromJson(json);
    } else {
      throw Exception("Error fetching appointment: ${response.statusCode}");
    }
  }

  Future<void> createAppointment(CreateAppointmentRequestDto appointment) async {
    final url = Uri.parse("$baseUrl$appointmentsEndpoint");
    final headers = await _getHeaders();
    // Note: The API likely expects a specific request DTO, but for now we'll try sending the appointment object
    // If the API requires a different structure (e.g. without ID), we might need a CreateAppointmentRequestDto
    final body = jsonEncode(appointment.toJson());
    print("AppointmentRepository: POST $url");
    print("AppointmentRepository: Request Body: $body");

    final response = await http.post(url, headers: headers, body: body);
    print("AppointmentRepository: Response Status: ${response.statusCode}");
    print("AppointmentRepository: Response Body: ${response.body}");

    if (response.statusCode == 401) {
      throw Exception("Sesión expirada. Por favor, inicia sesión nuevamente.");
    }

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Error creating appointment: ${response.body}");
    }
  }

  Future<void> deleteAppointment(int id) async {
    final url = Uri.parse("$baseUrl$appointmentsEndpoint/$id");
    final headers = await _getHeaders();
    print("AppointmentRepository: DELETE $url");

    final response = await http.delete(url, headers: headers);
    print("AppointmentRepository: Response Status: ${response.statusCode}");

    if (response.statusCode == 401) {
      throw Exception("Sesión expirada. Por favor, inicia sesión nuevamente.");
    }

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception("Error deleting appointment: ${response.body}");
    }
  }
}


final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  final storage = ref.watch(sessionStorageProvider);
  return AppointmentRepository(storage);
});
