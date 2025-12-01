import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../api/NotificationsNotifier.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  String selectedStatus = 'all';

  @override
  void initState() {
    super.initState();
    // Carga inicial de notificaciones del usuario logueado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notificationsNotifierProvider.notifier).refresh();
    });
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'read':
        return Colors.green.shade100;
      case 'unread':
        return Colors.blue.shade100;
      case 'archived':
        return Colors.grey.shade300;
      default:
        return Colors.white;
    }
  }

  Icon _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'read':
        return const Icon(Icons.check_circle, color: Colors.green);
      case 'unread':
        return const Icon(Icons.mark_email_unread, color: Colors.blue);
      case 'archived':
        return const Icon(Icons.archive, color: Colors.grey);
      default:
        return const Icon(Icons.notifications);
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifications = ref.watch(notificationsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.teal,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton<String>(
              value: selectedStatus,
              underline: const SizedBox(),
              items: ['all', 'read', 'unread', 'archived']
                  .map((status) => DropdownMenuItem(
                value: status,
                child: Text(
                  status.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ))
                  .toList(),
              onChanged: (status) {
                if (status != null) {
                  setState(() {
                    selectedStatus = status;
                  });
                  if (status == 'all') {
                    ref.read(notificationsNotifierProvider.notifier).refresh();
                  } else {
                    ref
                        .read(notificationsNotifierProvider.notifier)
                        .fetchByStatus(status);
                  }
                }
              },
            ),
          ),
        ],
      ),
      body: notifications.when(
        data: (list) => list.isEmpty
            ? const Center(
          child: Text(
            'No notifications',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: list.length,
          itemBuilder: (_, i) {
            final item = list[i];
            return Card(
              color: _getStatusColor(item.status),
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              child: ListTile(
                leading: _getStatusIcon(item.status),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.mark_email_read, color: Colors.teal),
                      tooltip: 'Mark as Read',
                      onPressed: () {
                        ref
                            .read(notificationsNotifierProvider.notifier)
                            .markRead(item.id);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.archive, color: Colors.grey),
                      tooltip: 'Archive',
                      onPressed: () {
                        ref
                            .read(notificationsNotifierProvider.notifier)
                            .archive(item.id);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  // Aquí luego puedes abrir detalle completo de la notificación
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
          child: Text('Error: $e', style: const TextStyle(color: Colors.red)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          ref.read(notificationsNotifierProvider.notifier).refresh();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}