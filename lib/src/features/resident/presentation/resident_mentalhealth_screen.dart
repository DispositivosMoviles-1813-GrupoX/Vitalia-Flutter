import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/mental_health_repository.dart';
import '../domain/mental_health_record.dart';

class ResidentMentalHealthScreen extends StatefulWidget {
  const ResidentMentalHealthScreen({super.key});

  @override
  State<ResidentMentalHealthScreen> createState() =>
      _ResidentMentalHealthScreenState();
}

class _ResidentMentalHealthScreenState
    extends State<ResidentMentalHealthScreen> {
  late Future<List<MentalHealthRecord>> _recordsFuture;
  final MentalHealthRepository _repository = MentalHealthRepository();
  final int _residentId = 1;

  @override
  void initState() {
    super.initState();
    _refreshRecords();
  }

  void _refreshRecords() {
    setState(() {
      _recordsFuture = _repository.getMentalHealthRecords(_residentId);
    });
  }

  Future<void> _addRecord() async {
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
                await _repository.addMentalHealthRecord(
                  _residentId,
                  diagnosisController.text,
                  treatmentController.text,
                );
                if (mounted) {
                  Navigator.pop(context);
                  _refreshRecords();
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

  Future<void> _deleteRecord(int id) async {
    try {
      await _repository.deleteMentalHealthRecord(_residentId, id);
      _refreshRecords();
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
    return Scaffold(
      appBar: AppBar(title: const Text("Salud Mental")),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRecord,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<MentalHealthRecord>>(
        future: _recordsFuture,
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
                child: Text("No hay registros de salud mental."));
          }

          final records = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: records.length,
            itemBuilder: (_, i) {
              final item = records[i];
              final formattedDate =
                  DateFormat('yyyy-MM-dd').format(item.date);

              return Card(
                child: ListTile(
                  leading: const Icon(Icons.psychology, color: Colors.teal),
                  title: Text(item.diagnosis),
                  subtitle: Text(item.treatment),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 12),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteRecord(item.id!),
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

