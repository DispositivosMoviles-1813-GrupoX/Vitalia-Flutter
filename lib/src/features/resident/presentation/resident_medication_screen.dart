import 'package:flutter/material.dart';
import '../data/medication_repository.dart';
import '../domain/medication.dart';

class ResidentMedicationsScreen extends StatefulWidget {
  const ResidentMedicationsScreen({super.key});

  @override
  State<ResidentMedicationsScreen> createState() =>
      _ResidentMedicationsScreenState();
}

class _ResidentMedicationsScreenState extends State<ResidentMedicationsScreen> {
  late Future<List<Medication>> _medicationsFuture;
  final MedicationRepository _repository = MedicationRepository();
  final int _residentId = 1;

  @override
  void initState() {
    super.initState();
    _refreshMedications();
  }

  void _refreshMedications() {
    setState(() {
      _medicationsFuture = _repository.getMedications(_residentId);
    });
  }

  Future<void> _addMedication() async {
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
                await _repository.addMedication(
                  _residentId,
                  nameController.text,
                  frequencyController.text,
                );
                if (mounted) {
                  Navigator.pop(context);
                  _refreshMedications();
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

  Future<void> _deleteMedication(int id) async {
    try {
      await _repository.deleteMedication(_residentId, id);
      _refreshMedications();
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
    return Scaffold(
      appBar: AppBar(title: const Text("Medicación")),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMedication,
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
                    onPressed: () => _deleteMedication(med.id!),
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

