import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../application/mental_health_provider.dart';
import '../application/resident_provider.dart';
import '../domain/mental_health_record.dart';

class ResidentMentalHealthScreen extends ConsumerStatefulWidget {
  const ResidentMentalHealthScreen({super.key});

  @override
  ConsumerState<ResidentMentalHealthScreen> createState() =>
      _ResidentMentalHealthScreenState();
}

class _ResidentMentalHealthScreenState
    extends ConsumerState<ResidentMentalHealthScreen> {
  late Future<List<MentalHealthRecord>> _recordsFuture;
  int? _currentResidentId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final residentAsync = ref.watch(residentProvider);
    residentAsync.whenData((resident) {
      if (resident.id != null && resident.id != _currentResidentId) {
        _currentResidentId = resident.id;
        _refreshRecords(resident.id!);
      }
    });
  }

  void _refreshRecords(int residentId) {
    setState(() {
      _recordsFuture = ref.read(mentalHealthRepositoryProvider).getMentalHealthRecords(residentId);
    });
  }

  Future<void> _addRecord(int residentId) async {
    final diagnosisController = TextEditingController();
    final treatmentController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Agregar Registro de Salud Mental"),
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
                await ref.read(mentalHealthRepositoryProvider).addMentalHealthRecord(
                  residentId,
                  diagnosisController.text,
                  treatmentController.text,
                );
                if (mounted) {
                  Navigator.pop(context);
                  _refreshRecords(residentId);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Registro agregado correctamente")),
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

  Future<void> _deleteRecord(int residentId, int id) async {
    try {
      await ref.read(mentalHealthRepositoryProvider).deleteMentalHealthRecord(residentId, id);
      _refreshRecords(residentId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registro eliminado correctamente")),
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
      backgroundColor: const Color(0xFFF0F8F7), // Soft teal background
      appBar: AppBar(
        title: const Text(
          "Salud Mental",
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Color(0xFF00695C)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Color(0xFF00695C)),
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
            _recordsFuture = ref.read(mentalHealthRepositoryProvider).getMentalHealthRecords(resident.id!);
          }

          return Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: FloatingActionButton(
              onPressed: () => _addRecord(resident.id!),
              backgroundColor: const Color(0xFF26A69A),
              child: const Icon(Icons.edit_note, color: Colors.white),
            ),
            body: FutureBuilder<List<MentalHealthRecord>>(
              future: _recordsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: Color(0xFF26A69A)));
                }

                if (snapshot.hasError) {
                  return Center(
                      child: Text("Error al cargar datos: ${snapshot.error}"));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.spa_outlined, size: 64, color: Color(0xFFB2DFDB)),
                        SizedBox(height: 16),
                        Text(
                          "Sin registros de salud mental",
                          style: TextStyle(color: Color(0xFF80CBC4), fontSize: 16),
                        ),
                      ],
                    ),
                  );
                }

                final records = snapshot.data!;

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: records.length,
                  itemBuilder: (_, i) {
                    final item = records[i];
                    final formattedDate =
                        DateFormat('dd MMM yyyy').format(item.date);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00695C).withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
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
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today_outlined, 
                                      size: 14, color: Color(0xFF80CBC4)),
                                    const SizedBox(width: 6),
                                    Text(
                                      formattedDate,
                                      style: const TextStyle(
                                        color: Color(0xFF4DB6AC),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close, color: Color(0xFFEF9A9A), size: 20),
                                  onPressed: () => _deleteRecord(resident.id!, item.id!),
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              item.diagnosis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF004D40),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE0F2F1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.healing, size: 16, color: Color(0xFF26A69A)),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      item.treatment,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF00796B),
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
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

