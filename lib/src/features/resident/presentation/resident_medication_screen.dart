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
      backgroundColor: Colors.blueGrey[50], // Clinical background
      appBar: AppBar(
        title: const Text(
          "Medicación",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blueGrey),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
      ),
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
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () => _addMedication(resident.id!),
              backgroundColor: Colors.blue[700],
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text("Nueva Medicación", style: TextStyle(color: Colors.white)),
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
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.medication_outlined, size: 64, color: Colors.blue[200]),
                        const SizedBox(height: 16),
                        Text(
                          "No hay medicación registrada",
                          style: TextStyle(color: Colors.blueGrey[400], fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }

                final medications = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: medications.length,
                  itemBuilder: (_, i) {
                    final med = medications[i];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              Container(
                                width: 6,
                                color: Colors.blue[600],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              med.name,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey[800],
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete_outline, color: Colors.red[300]),
                                            onPressed: () => _deleteMedication(resident.id!, med.id!),
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(Icons.access_time, size: 16, color: Colors.blue[400]),
                                          const SizedBox(width: 8),
                                          Text(
                                            med.frequency,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.blueGrey[600],
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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

