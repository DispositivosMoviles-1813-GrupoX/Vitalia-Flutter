import 'package:flutter/material.dart';

class ResidentMedicalHistoryScreen extends StatelessWidget {
  const ResidentMedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final histories = [
      {
        "date": "2024-10-01",
        "diagnosis": "Hipertensión",
        "treatment": "Control semanal + medicación"
      },
      {
        "date": "2024-08-21",
        "diagnosis": "Infección urinaria",
        "treatment": "Antibióticos por 10 días"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Historial Médico")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: histories.length,
        itemBuilder: (_, i) {
          final item = histories[i];
          return Card(
            child: ListTile(
              leading:
              const Icon(Icons.monitor_heart, color: Colors.deepPurple),
              title: Text(item["diagnosis"]!),
              subtitle: Text("Tratamiento: ${item["treatment"]}"),
              trailing: Text(item["date"]!,
                  style: const TextStyle(fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}
