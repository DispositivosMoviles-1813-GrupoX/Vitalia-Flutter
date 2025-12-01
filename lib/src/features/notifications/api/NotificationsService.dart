import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/session/session_providers.dart';
import '../../../core/session/session_storage.dart';
import 'NotificationResponse.dart';

class NotificationsService {
  final SessionStorage storage;
  final String baseUrl = 'http://10.0.2.2:8080/api/v1/notifications';

  NotificationsService(this.storage);

  Future<List<NotificationResponse>> getNotifications() async {
    final token = await storage.getAccessToken();
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => NotificationResponse.objJason(json)).toList();
    } else {
      throw Exception('Failed to load notifications: ${response.statusCode}');
    }
  }

  Future<List<NotificationResponse>> getNotificationsByUser() async {
    final token = await storage.getAccessToken();
    final userId = await storage.getUserId();

    if (userId == null) {
      throw Exception('User ID not found. Login required.');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/userId/$userId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => NotificationResponse.objJason(json)).toList();
    } else {
      throw Exception('Failed to load notifications for user $userId');
    }
  }

  Future<List<NotificationResponse>> getNotificationsByUserAndStatus(String status) async {
    final token = await storage.getAccessToken();
    final userId = await storage.getUserId();

    if (userId == null) {
      throw Exception('User ID not found. Login required.');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/userId/$userId/status?status=$status'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => NotificationResponse.objJason(json)).toList();
    } else {
      throw Exception('Failed to load notifications for user $userId with status $status');
    }
  }

  Future<void> markAsRead(int notificationId) async {
    final token = await storage.getAccessToken();
    final response = await http.post(
      Uri.parse('$baseUrl/$notificationId/mark-as-read'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to mark notification $notificationId as read');
    }
  }

  Future<void> archiveNotification(int notificationId) async {
    final token = await storage.getAccessToken();
    final response = await http.post(
      Uri.parse('$baseUrl/$notificationId/archive'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to archive notification $notificationId');
    }
  }
}

// Provider para Riverpod
final notificationsServiceProvider = Provider<NotificationsService>((ref) {
  final storage = ref.read(sessionStorageProvider);
  return NotificationsService(storage);
});
