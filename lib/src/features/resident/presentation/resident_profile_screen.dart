import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../application/resident_provider.dart';
import '../domain/resident.dart';

class ResidentProfileScreen extends ConsumerWidget {
  const ResidentProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider que trae los datos del residente
    final residentAsync = ref.watch(residentProvider);

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      appBar: AppBar(
        title: const Text("Perfil del Residente"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.teal[800],
      ),
      body: residentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
        data: (resident) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // --- SECCIÓN CABECERA (FOTO Y NOMBRE) ---
              _buildHeader(resident),
              const SizedBox(height: 24),

              // --- SECCIÓN DATOS PERSONALES ---
              _buildSectionTitle("Información Personal"),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    _infoTile(Icons.badge, "DNI", resident.dni),
                    _divider(),
                    _infoTile(Icons.cake, "Fecha de Nacimiento",
                        resident.birthDate != null
                            ? DateFormat('dd/MM/yyyy').format(resident.birthDate!)
                            : null
                    ),
                    _divider(),
                    _infoTile(Icons.wc, "Género", resident.gender),
                    _divider(),
                    _infoTile(Icons.receipt_long, "ID Recibo", resident.receiptId?.toString()),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // --- SECCIÓN UBICACIÓN ---
              _buildSectionTitle("Ubicación y Contacto"),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    _infoTile(Icons.location_on, "Dirección", resident.street),
                    _divider(),
                    _infoTile(Icons.location_city, "Ciudad / Estado",
                        _formatLocation(resident.city, resident.state)
                    ),
                    _divider(),
                    _infoTile(Icons.public, "País", resident.country),
                    _divider(),
                    _infoTile(Icons.markunread_mailbox, "Código Postal", resident.zipCode),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // --- SECCIÓN SALUD (Si tienes estos datos) ---
/*              if (resident.allergies != null || resident.conditions != null) ...[
                _buildSectionTitle("Información Médica"),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      _infoTile(Icons.warning_amber, "Alergias", resident.allergies),
                      _divider(),
                      _infoTile(Icons.medical_services, "Condiciones", resident.conditions),
                      _divider(),
                      _infoTile(Icons.contact_phone, "Emergencia", resident.emergencyContact),
                    ],
                  ),
                ),
              ],*/
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(Resident resident) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.teal.shade200, width: 3),
          ),
          child: CircleAvatar(
            radius: 55,
            backgroundImage: NetworkImage(resident.photoUrl ?? "https://i.pravatar.cc/150?img=11"),
            backgroundColor: Colors.grey[200],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          resident.fullName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D3748),
          ),
          textAlign: TextAlign.center,
        ),
        if (resident.status != null) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              resident.status!,
              style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold),
            ),
          )
        ]
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal[800],
          ),
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String? value) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.teal[700], size: 20),
      ),
      title: Text(
        label,
        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
      ),
      subtitle: Text(
        value ?? "No registrado",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 1, indent: 20, endIndent: 20);
  }

  String? _formatLocation(String? city, String? state) {
    if (city != null && state != null) return "$city, $state";
    return city ?? state;
  }
}