import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../auth/application/auth_notifier.dart';


class Resident {
  final String id;
  final String fullName;
  final int age;
  final String photoUrl;
  final String status;
  final DateTime lastUpdate;

  Resident({
    required this.id,
    required this.fullName,
    required this.age,
    required this.photoUrl,
    required this.status,
    required this.lastUpdate,
  });
}

final residentProvider = FutureProvider<Resident>((ref) async {
  await Future.delayed(const Duration(milliseconds: 900));

  return Resident(
    id: "1",
    fullName: "Jorge Gonzáles",
    age: 82,
    photoUrl: "https://i.pravatar.cc/150?img=65",
    status: "Estable",
    lastUpdate: DateTime.now(),
  );
});
// --------------------------------------------------

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
            backgroundImage: NetworkImage(resident.photoUrl),
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
                Text(
                  "${resident.age} años",
                  style: TextStyle(color: Colors.white.withOpacity(0.9)),
                ),
                const SizedBox(height: 6),
                Text(
                  "Última actualización: hace unos minutos",
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
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: const CircleAvatar(
          radius: 26,
          backgroundColor: Color(0x44FF5252),
          child: Icon(Icons.monitor_heart, color: Colors.red, size: 28),
        ),
        title: const Text(
          "Estado actual",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          resident.status,
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
          route: "/resident/notifications",
        ),
        _menuCard(
          context,
          icon: Icons.calendar_month,
          title: "Citas Médicas",
          route: "/resident/appointments",
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
