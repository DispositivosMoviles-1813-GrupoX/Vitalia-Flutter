import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

            // ********** HEADER **********
            _residentHeader(),

            const SizedBox(height: 24),

            // *******************
            const Text(
              "Acceso rápido",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _quickActions(),

            const SizedBox(height: 24),

            // ********************
            const Text(
              "Estado actual",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            _statusCard(
              title: "Signos vitales",
              subtitle: "Última medición hace 2 horas",
              icon: Icons.monitor_heart,
              color: Colors.pinkAccent,
            ),

            _statusCard(
              title: "Medicamentos",
              subtitle: "2 pastillas pendientes hoy",
              icon: Icons.medication,
              color: Colors.indigo,
            ),

            _statusCard(
              title: "Actividad",
              subtitle: "El residente caminó 300 pasos",
              icon: Icons.directions_walk,
              color: Colors.green,
            ),

            const SizedBox(height: 24),

            // ********************
            const Text(
              "Comunicación",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 12),
            _messageCard(),
          ],
        ),
      ),
    );
  }


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
                  "Residente - Habitación 305",
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

  Widget _quickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _actionItem(Icons.medical_information, "Historial"),
        _actionItem(Icons.list_alt, "Reporte diario"),
        _actionItem(Icons.emergency, "Emergencia"),
        _actionItem(Icons.chat, "Chat"),
      ],
    );
  }

  Widget _actionItem(IconData icon, String label) {
    return Column(
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
    );
  }

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
            backgroundColor: color.withAlpha(55),
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

  Widget _messageCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.chat_bubble_outline, size: 28, color: Colors.teal),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "¿Quieres comunicarte con el doctor o cuidador?\nEscríbeles un mensaje ahora.",
              style: TextStyle(fontSize: 14),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Abrir chat"),
          )
        ],
      ),
    );
  }
}
