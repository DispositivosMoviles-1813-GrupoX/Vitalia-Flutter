import 'package:flutter/material.dart';

class ResidentMedicationsScreen extends StatelessWidget {
  const ResidentMedicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final medications = [
      {"name": "Losartán", "frequency": "1 vez al día"},
      {"name": "Metformina", "frequency": "2 veces al día"},
      {"name": "Atorvastatina", "frequency": "1 vez al día"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Medicación")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: medications.length,
        itemBuilder: (_, i) {
          final med = medications[i];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.medication, color: Colors.blue),
              title: Text(med["name"]!),
              subtitle: Text(med["frequency"]!),
            ),
          );
        },
      ),
    );
  }
}
