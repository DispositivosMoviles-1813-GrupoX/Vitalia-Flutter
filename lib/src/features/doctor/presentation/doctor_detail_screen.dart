import 'package:flutter/material.dart';
import '../domain/doctor.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Detalle del Doctor"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Hero(
              tag: 'doctor-${doctor.id}',
              child: CircleAvatar(
                radius: 60,
                backgroundImage: doctor.photoUrl != null
                    ? NetworkImage(doctor.photoUrl!)
                    : const AssetImage('assets/images/doctor_placeholder.png') as ImageProvider,
                onBackgroundImageError: (_, __) {},
                child: doctor.photoUrl == null ? const Icon(Icons.person, size: 60) : null,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${doctor.nameData.firstName} ${doctor.nameData.lastName}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              doctor.specialty,
              style: TextStyle(
                fontSize: 18,
                color: Colors.teal[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _InfoTile(
                    icon: Icons.badge,
                    label: "Licencia (CMP)",
                    value: doctor.licenseNumber ?? "No registrado",
                  ),
                  const Divider(),
                  _InfoTile(
                    icon: Icons.email,
                    label: "Correo Electrónico",
                    value: doctor.email ?? "No registrado",
                  ),
                  const Divider(),
                  _InfoTile(
                    icon: Icons.phone,
                    label: "Teléfono",
                    value: doctor.contactData?.phone ?? "No registrado",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.teal[700], size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2D3748),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
