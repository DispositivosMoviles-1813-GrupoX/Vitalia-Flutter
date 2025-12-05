import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../resident/application/resident_provider.dart';
import '../application/auth_notifier.dart';
import '../application/home_info_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentAsync = ref.watch(residentProvider);
    final homeInfoAsync = ref.watch(homeInfoFutureProvider);

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
            residentAsync.when(
              data: (resident) => _residentHeader(
                name: resident.fullName,
                details: "Residente", // Could add room info if available in model
                photoUrl: resident.photoUrl,
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => _residentHeader(
                name: "Error al cargar",
                details: "Intente nuevamente",
              ),
            ),

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

            homeInfoAsync.when(
              data: (homeInfo) {
                if (!homeInfo.hasData) {
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      children: [
                        Icon(Icons.info_outline, size: 48, color: Colors.grey[400]),
                        const SizedBox(height: 12),
                        const Text(
                          "No hay información disponible",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Aún no tiene doctor asignado ni citas próximas.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    _statusCard(
                      title: "Doctor asignado",
                      subtitle: "${homeInfo.doctorName} — ${homeInfo.doctorStatus}",
                      icon: Icons.medical_services_outlined,
                      color: Colors.teal,
                    ),
                    _statusCard(
                      title: "Próxima cita",
                      subtitle: "${homeInfo.nextAppointmentDate} — ${homeInfo.nextAppointmentType}",
                      icon: Icons.event,
                      color: Colors.indigo,
                    ),
                    _statusCard(
                      title: "Última actualización",
                      subtitle: homeInfo.lastUpdate,
                      icon: Icons.update,
                      color: Colors.orange,
                    ),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text("Error al cargar información: $e")),
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
  Widget _residentHeader({
    required String name,
    required String details,
    String? photoUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff2A9D90),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundImage: photoUrl != null 
                ? NetworkImage(photoUrl) 
                : const AssetImage('assets/images/perfil.jpg') as ImageProvider,
            onBackgroundImageError: (_, __) {
              // Fallback handled by default or could be improved
            },
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  details,
                  style: const TextStyle(
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
        _actionItem(Icons.event, "Agendar Citas", onTap: () {
          context.push('/appointments/create');
        }),
        _actionItem(Icons.local_hospital, "Doctor", onTap: () {
           context.push('/doctor-list');
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

  /// ========== NOTIFICATIONS CARD ==========
  Widget _notificationsCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
         // context.push('/notifications'); // TODO: Implement route
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Próximamente")));
      },
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
