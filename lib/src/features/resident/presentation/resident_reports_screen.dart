import 'package:flutter/material.dart';

class ResidentReportsScreen extends StatelessWidget {
  const ResidentReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reports = [
      {
        "date": "2024-10-10",
        "summary": "El residente tuvo un buen día.",
        "details":
        "Comió bien, descanso adecuado, sin incidentes médicos.",
      },
      {
        "date": "2024-10-09",
        "summary": "Alerta leve",
        "details":
        "Se reportó mareo al levantarse, monitoreo constante.",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Reportes")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reports.length,
        itemBuilder: (_, i) {
          final r = reports[i];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.receipt_long,
                  color: Colors.teal),
              title: Text(r["summary"]!),
              subtitle: Text(r["details"]!),
              trailing: Text(r["date"]!,
                  style: const TextStyle(fontSize: 12)),
            ),
          );
        },
      ),
    );
  }
}
