import 'package:flutter/material.dart';

class ResidentProfileScreen extends StatelessWidget {
  const ResidentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final profile = {
      "fullName": "Jorge Gonzáles",
      "age": 82,
      "photoUrl": "https://i.pravatar.cc/150?img=65",
      "emergencyContact": "987654321",
      "allergies": "Penicilina, Mariscos",
      "conditions": "Hipertensión, Diabetes tipo 2",
      "address": "Residencia Vitalia - Habitación 204",
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Perfil del Residente")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profile["photoUrl"] as String),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              profile["fullName"] as String,
              style: const TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Center(child: Text("${profile["age"]} años")),

          const SizedBox(height: 30),

          _item("Contacto de emergencia", profile["emergencyContact"] as String),
          _item("Alergias", profile["allergies"] as String),
          _item("Condiciones médicas", profile["conditions"] as String),
          _item("Ubicación", profile["address"] as String),
        ],
      ),
    );
  }

  Widget _item(String label, String value) {
    return Card(
      child: ListTile(
        title: Text(label),
        subtitle: Text(value),
        leading: const Icon(Icons.info_outline),
      ),
    );
  }
}
