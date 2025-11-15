import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../application/auth_notifier.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authNotifierProvider).value;

    return Scaffold(
      backgroundColor: const Color(0xffF4F6F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Vitalia",
          style: TextStyle(
            color: Colors.teal[800],
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black87),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// -- HEADER --
            _residentHeader(),

            const SizedBox(height: 24),

            const Text(
              "Acceso rápido",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _quickActions(context),

            const SizedBox(height: 28),

            const Text(
              "Estado del residente",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            _statusCard(
              title: "Doctor asignado",
              subtitle: "Dr. Luis Aranda — Disponible",
              icon: Icons.medical_services_outlined,
              color: Colors.teal,
            ),
            _statusCard(
              title: "Próxima cita",
              subtitle: "15 Nov, 10:00 AM — Control general",
              icon: Icons.event,
              color: Colors.indigo,
            ),
            _statusCard(
              title: "Última actualización",
              subtitle: "Reporte diario enviado hoy a las 9:20 AM",
              icon: Icons.update,
              color: Colors.orange,
            ),

            const SizedBox(height: 24),

            /// -- NOTIFICATIONS --
            const Text(
              "Notificaciones",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _notificationsCard(context),
          ],
        ),
      ),
    );
  }

  /// ========== HEADER==========
  Widget _residentHeader() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff2A9D90),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundImage: AssetImage('assets/images/perfil.jpg'),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Jorge Gonzales",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Habitación 305 — Residente",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _quickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionItem(Icons.person_search, "Overview", onTap: () {
          context.push('/resident');
        }),
        _actionItem(Icons.notifications, "Notificaciones", onTap: () {
          context.push('/notifications');
        }),
        _actionItem(Icons.event, "Citas", onTap: () {
          context.push('/appointments');
        }),
        _actionItem(Icons.local_hospital, "Doctor", onTap: () {
          context.push('/resident/doctor');
        }),
      ],
    );
  }

  Widget _actionItem(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withAlpha(55),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Icon(icon, size: 26, color: Colors.teal[700]),
          ),
          const SizedBox(height: 6),
          Text(label),
        ],
      ),
    );
  }

  /// ========== STATUS CARDS ==========
  Widget _statusCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withAlpha(55),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: color.withOpacity(.15),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ========== NOTIFICATIONS CARD ==========
  Widget _notificationsCard(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/notifications'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Icon(Icons.notifications_active,
                size: 28, color: Colors.teal),
            const SizedBox(width: 12),
            const Expanded(
              child: Text(
                "Revisa los últimos avisos enviados por los doctores y cuidadores.",
                style: TextStyle(fontSize: 14),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}
