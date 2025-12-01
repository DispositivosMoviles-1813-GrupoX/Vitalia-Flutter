import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/resident_provider.dart';
import '../domain/resident.dart';

class ResidentProfileScreen extends ConsumerStatefulWidget {
  const ResidentProfileScreen({super.key});

  @override
  ConsumerState<ResidentProfileScreen> createState() => _ResidentProfileScreenState();
}

class _ResidentProfileScreenState extends ConsumerState<ResidentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // Let's use the residentProvider which already handles fetching the correct resident for the user.
    final residentAsync = ref.watch(residentProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Perfil del Residente")),
      body: residentAsync.when(
        data: (resident) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(resident.photoUrl ?? "https://i.pravatar.cc/150?img=65"),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                resident.fullName,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),

            _item("DNI", resident.dni),
            _item("Contacto de emergencia", resident.emergencyContact ?? "No registrado"),
            _item("Alergias", resident.allergies ?? "Ninguna"),
            _item("Condiciones médicas", resident.conditions ?? "Ninguna"),
            _item("Ubicación", resident.address ?? "No registrada"),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error al cargar perfil: $err")),
      ),
    );
  }

  Widget _item(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
        leading: const Icon(Icons.info_outline),
      ),
    );
  }
}

