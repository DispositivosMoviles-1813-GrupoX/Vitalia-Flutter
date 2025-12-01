import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/medical_history_repository.dart';
import '../domain/medical_history.dart';

class ResidentMedicalHistoryScreen extends StatefulWidget {
  const ResidentMedicalHistoryScreen({super.key});

  @override
  State<ResidentMedicalHistoryScreen> createState() =>
      _ResidentMedicalHistoryScreenState();
}

class _ResidentMedicalHistoryScreenState
    extends State<ResidentMedicalHistoryScreen> {
  late Future<List<MedicalHistory>> _historiesFuture;
  final MedicalHistoryRepository _repository = MedicalHistoryRepository();
  // Hardcoded resident ID for now, as per plan
  final int _residentId = 1;

  @override
  void initState() {
    super.initState();
    _refreshHistories();
  }

  void _refreshHistories() {
    setState(() {
      _historiesFuture = _repository.getMedicalHistories(_residentId);
    });
  }

  Future<void> _addMedicalHistory() async {
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
                await _repository.addMedicalHistory(
                  _residentId,
                  diagnosisController.text,
                  treatmentController.text,
                );
                if (mounted) {
                  Navigator.pop(context);
                  _refreshHistories();
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

  Future<void> _deleteMedicalHistory(int id) async {
    try {
      await _repository.deleteMedicalHistory(_residentId, id);
      _refreshHistories();
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
    return Scaffold(
      appBar: AppBar(title: const Text("Historial Médico")),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMedicalHistory,
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
                  DateFormat('dd/MM/yyyy').format(item.date);

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
                        onPressed: () => _deleteMedicalHistory(item.id!),
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
  }
}