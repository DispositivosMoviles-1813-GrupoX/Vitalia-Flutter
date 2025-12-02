import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../application/medical_history_provider.dart';
import '../application/resident_provider.dart';
import '../domain/medical_history.dart';

class ResidentMedicalHistoryScreen extends ConsumerStatefulWidget {
  const ResidentMedicalHistoryScreen({super.key});

  @override
  ConsumerState<ResidentMedicalHistoryScreen> createState() =>
      _ResidentMedicalHistoryScreenState();
}

class _ResidentMedicalHistoryScreenState
    extends ConsumerState<ResidentMedicalHistoryScreen> {
  late Future<List<MedicalHistory>> _historiesFuture;
  int? _currentResidentId; // To track the resident ID for which histories are currently loaded

  @override
  void initState() {
    super.initState();
    // _historiesFuture will be initialized in didChangeDependencies
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access ref here to get the resident ID and initialize _historiesFuture
    final residentAsync = ref.watch(residentProvider);
    residentAsync.whenData((resident) {
      if (resident.id != null && resident.id != _currentResidentId) {
        _currentResidentId = resident.id;
        _refreshHistories(resident.id!);
      }
    });
  }

  void _refreshHistories(int residentId) {
    setState(() {
      _historiesFuture = ref.read(medicalHistoryRepositoryProvider).getMedicalHistories(residentId);
    });
  }

  Future<void> _addMedicalHistory(int residentId) async {
    final diagnosisController = TextEditingController();
    final treatmentController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Agregar Historial Médico"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: diagnosisController,
              decoration: const InputDecoration(labelText: "Diagnóstico"),
            ),
            TextField(
              controller: treatmentController,
              decoration: const InputDecoration(labelText: "Tratamiento"),
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
                await ref.read(medicalHistoryRepositoryProvider).addMedicalHistory(
                  residentId,
                  diagnosisController.text,
                  treatmentController.text,
                );
                if (mounted) {
                  Navigator.pop(context);
                  _refreshHistories(residentId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Historial agregado correctamente")),
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

  Future<void> _deleteMedicalHistory(int residentId, int id) async {
    try {
      await ref.read(medicalHistoryRepositoryProvider).deleteMedicalHistory(residentId, id);
      _refreshHistories(residentId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Historial eliminado correctamente")),
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
      appBar: AppBar(title: const Text("Historial Médico")),
      body: residentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error al cargar residente: $e")),
        data: (resident) {
          // Ensure resident.id is not null before proceeding
          if (resident.id == null) {
            return const Center(child: Text("ID de residente no disponible."));
          }

          // If _historiesFuture hasn't been initialized yet (e.g., first build after resident data is available)
          // or if the resident ID has changed, re-initialize it.
          // This check is mostly for safety, as didChangeDependencies should handle it.
          if (_currentResidentId == null || _currentResidentId != resident.id) {
            _currentResidentId = resident.id;
            _historiesFuture = ref.read(medicalHistoryRepositoryProvider).getMedicalHistories(resident.id!);
          }

          return Scaffold(
             // Floating action button needs resident ID
            floatingActionButton: FloatingActionButton(
              onPressed: () => _addMedicalHistory(resident.id!),
              child: const Icon(Icons.add),
            ),
            body: FutureBuilder<List<MedicalHistory>>(
              future: _historiesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                      child: Text("Error al cargar datos: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text("No hay historial médico disponible."));
                }

                final histories = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: histories.length,
                  itemBuilder: (_, i) {
                    final item = histories[i];
                    final formattedDate =
                        DateFormat('dd/MM/yyyy').format(item.recordDate);

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        leading: const Icon(
                            Icons.monitor_heart, color: Colors.deepPurple),
                        title: Text(item.diagnosis),
                        subtitle: Text("Tratamiento: ${item.treatment}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(fontSize: 12, color: Colors.black54),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteMedicalHistory(resident.id!, item.id!),
                            ),
                          ],
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