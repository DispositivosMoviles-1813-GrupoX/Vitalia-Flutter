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
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Historial Médico",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black87),
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
            _historiesFuture = ref.read(medicalHistoryRepositoryProvider).getMedicalHistories(resident.id!);
          }

          return Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: () => _addMedicalHistory(resident.id!),
              backgroundColor: Colors.deepPurple,
              elevation: 4,
              child: const Icon(Icons.add, color: Colors.white),
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
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history_edu, size: 64, color: Colors.grey[300]),
                        const SizedBox(height: 16),
                        Text(
                          "No hay historial médico",
                          style: TextStyle(color: Colors.grey[500], fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }

                final histories = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: histories.length,
                  itemBuilder: (_, i) {
                    final item = histories[i];
                    final formattedDate =
                        DateFormat('dd MMM yyyy').format(item.recordDate);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    formattedDate,
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete_outline_rounded,
                                      color: Colors.grey[400], size: 22),
                                  onPressed: () =>
                                      _deleteMedicalHistory(resident.id!, item.id!),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  splashRadius: 20,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              item.diagnosis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                letterSpacing: -0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.treatment,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[600],
                                height: 1.5,
                              ),
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