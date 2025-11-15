import 'package:flutter/material.dart';

class ResidentMentalHealthScreen extends StatelessWidget {
  const ResidentMentalHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final records = [
      {
        "date": "2024-09-10",
        "diagnosis": "Ansiedad leve",
        "treatment": "Terapia cognitiva semanal"
      },
      {
        "date": "2024-07-18",
        "diagnosis": "Insomnio",
        "treatment": "Rutina de sueño + relajación"
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Salud Mental")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: records.length,
        itemBuilder: (_, i) {
          final item = records[i];
          return Card(
            child: ListTile(
              leading:
              const Icon(Icons.psychology, color: Colors.teal),
              title: Text(item["diagnosis"]!),
              subtitle: Text(item["treatment"]!),
              trailing: Text(item["date"]!,
                  style: const TextStyle(fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}
