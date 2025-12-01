import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'NotificationResponse.dart';
import 'NotificationsService.dart';

final notificationsNotifierProvider = AsyncNotifierProvider<NotificationsNotifier, List<NotificationResponse>>(
      () => NotificationsNotifier(),
);

class NotificationsNotifier extends AsyncNotifier<List<NotificationResponse>> {
  @override
  FutureOr<List<NotificationResponse>> build() async {
    return fetchAllByUser();
  }

  Future<List<NotificationResponse>> fetchAllByUser() async {
    final service = ref.read(notificationsServiceProvider);
    state = const AsyncLoading();
    try {
      final notifications = await service.getNotificationsByUser();
      state = AsyncData(notifications);
      return notifications;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }

  Future<void> refresh() async {
    await fetchAllByUser();
  }

  Future<void> markRead(int id) async {
    final service = ref.read(notificationsServiceProvider);
    await service.markAsRead(id);
    await refresh();
  }

  Future<void> archive(int id) async {
    final service = ref.read(notificationsServiceProvider);
    await service.archiveNotification(id);
    await refresh();
  }

  Future<void> fetchByStatus(String status) async {
    final service = ref.read(notificationsServiceProvider);
    state = const AsyncLoading();
    try {
      final notifications = await service.getNotificationsByUserAndStatus(status);
      state = AsyncData(notifications);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}