import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/application/auth_notifier.dart';
import '../application/resident_provider.dart';
import '../domain/resident.dart';

class ResidentOverviewScreen extends ConsumerWidget {
  const ResidentOverviewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentAsync = ref.watch(residentProvider);
    final user = ref.watch(authNotifierProvider).value;

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        title: Text("Bienvenido, ${user?.username ?? ''} 👋"),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black87),
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
          )
        ],
      ),
      body: residentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
        data: (resident) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _residentHeader(resident),
                const SizedBox(height: 28),

                _currentStatusCard(resident),
                const SizedBox(height: 28),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Opciones",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                _menuGrid(context),
              ],
            ),
          );
        },
      ),
    );
  }

  // ---------------- HEADER ---------------------
  Widget _residentHeader(Resident resident) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.teal[700],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 42,
            backgroundImage: resident.photoUrl != null
                ? NetworkImage(resident.photoUrl!)
                : const AssetImage('assets/images/perfil.jpg') as ImageProvider,
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resident.fullName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                // Age is not currently in the basic resource, might need details or calculation
                // Text(
                //   "${resident.age} años",
                //   style: TextStyle(color: Colors.white.withOpacity(0.9)),
                // ),
                const SizedBox(height: 6),
                Text(
                  "DNI: ${resident.dni ?? 'No registrado'}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- UID STATUS ---------------------
  Widget _currentStatusCard(Resident resident) {

    final random = Random(resident.id);

    final estados = [
      "Estable",
      "Descansando",
      "En actividad física",
      "Chequeo pendiente",
      "Buen ánimo"
    ];

    final estadoSeleccionado = estados[random.nextInt(estados.length)];
    final statusText = resident.status ?? estadoSeleccionado;

    Color statusColor = Colors.grey;
    IconData statusIcon = Icons.help_outline;

    if (statusText.contains("Estable") || statusText.contains("Buen ánimo")) {
      statusColor = Colors.green;
      statusIcon = Icons.sentiment_satisfied_alt;
    } else if (statusText.contains("Descansando")) {
      statusColor = Colors.blue;
      statusIcon = Icons.bed;
    } else if (statusText.contains("actividad")) {
      statusColor = Colors.orange;
      statusIcon = Icons.directions_run;
    } else if (statusText.contains("pendiente")) {
      statusColor = Colors.amber;
      statusIcon = Icons.warning_amber_rounded;
    }

    // 2. Renderizar la tarjeta
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: CircleAvatar(
          radius: 26,
          backgroundColor: statusColor.withAlpha(5),
          child: Icon(statusIcon, color: statusColor, size: 28),
        ),
        title: const Text(
          "Estado actual",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          statusText,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }

  // ---------------- GRID MENU ---------------------
  Widget _menuGrid(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      children: [
        _menuCard(
          context,
          icon: Icons.monitor_heart,
          title: "Historial Médico",
          route: "/resident/medical-history",
        ),
        _menuCard(
          context,
          icon: Icons.medication,
          title: "Medicación",
          route: "/resident/medication",
        ),
        _menuCard(
          context,
          icon: Icons.notifications_active,
          title: "Notificaciones",
          route: "/notifications",
        ),
        _menuCard(
          context,
          icon: Icons.calendar_month,
          title: "Citas Médicas",
          route: "/appointment-list",
        ),
        _menuCard(
          context,
          icon: Icons.psychology,
          title: "Salud Mental",
          route: "/resident/mental-health",
        ),
        _menuCard(
          context,
          icon: Icons.receipt_long,
          title: "Reportes",
          route: "/resident/reports",
        ),
        _menuCard(
          context,
          icon: Icons.person,
          title: "Perfil",
          route: "/resident/profile",
        ),
      ],
    );
  }

  // ---------------- MENU CARD ---------------------
  Widget _menuCard(BuildContext context,
      {required IconData icon,
        required String title,
        required String route}) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 38, color: Colors.teal[700]),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}

