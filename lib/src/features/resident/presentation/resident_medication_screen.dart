import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/medication_provider.dart';
import '../application/resident_provider.dart';
import '../domain/medication.dart';

class ResidentMedicationsScreen extends ConsumerStatefulWidget {
  const ResidentMedicationsScreen({super.key});

  @override
  ConsumerState<ResidentMedicationsScreen> createState() =>
      _ResidentMedicationsScreenState();
}

class _ResidentMedicationsScreenState extends ConsumerState<ResidentMedicationsScreen> {
  late Future<List<Medication>> _medicationsFuture;
  int? _currentResidentId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final residentAsync = ref.watch(residentProvider);
    residentAsync.whenData((resident) {
      if (resident.id != null && resident.id != _currentResidentId) {
        _currentResidentId = resident.id;
        _refreshMedications(resident.id!);
      }
    });
  }

  void _refreshMedications(int residentId) {
    setState(() {
      _medicationsFuture = ref.read(medicationRepositoryProvider).getMedications(residentId);
    });
  }

  Future<void> _addMedication(int residentId) async {
    final nameController = TextEditingController();
    final frequencyController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Agregar Medicación"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nombre del medicamento"),
            ),
            TextField(
              controller: frequencyController,
              decoration: const InputDecoration(labelText: "Frecuencia"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await ref.read(medicationRepositoryProvider).addMedication(
                  residentId,
                  nameController.text,
                  frequencyController.text,
                );
                if (mounted) {
                  Navigator.pop(context);
                  _refreshMedications(residentId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Medicación agregada correctamente")),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error al agregar: $e")),
                  );
                }
              }
            },
            child: const Text("Guardar"),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteMedication(int residentId, int id) async {
    try {
      await ref.read(medicationRepositoryProvider).deleteMedication(residentId, id);
      _refreshMedications(residentId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Medicación eliminada correctamente")),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al eliminar: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final residentAsync = ref.watch(residentProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Medicación")),
      body: residentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error al cargar residente: $e")),
        data: (resident) {
          if (resident.id == null) {
            return const Center(child: Text("ID de residente no disponible."));
          }

          if (_currentResidentId == null || _currentResidentId != resident.id) {
            _currentResidentId = resident.id;
            _medicationsFuture = ref.read(medicationRepositoryProvider).getMedications(resident.id!);
          }

          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => _addMedication(resident.id!),
              child: const Icon(Icons.add),
            ),
            body: FutureBuilder<List<Medication>>(
              future: _medicationsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error al cargar datos: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No hay medicación registrada."));
                }

                final medications = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: medications.length,
                  itemBuilder: (_, i) {
                    final med = medications[i];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.medication, color: Colors.blue),
                        title: Text(med.name),
                        subtitle: Text(med.frequency),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteMedication(resident.id!, med.id!),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

