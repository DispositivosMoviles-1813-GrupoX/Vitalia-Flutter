class Medication {
  final int? id;
  final String name;
  final String frequency;

  Medication({
    this.id,
    required this.name,
    required this.frequency,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] as int?,
      name: json['name'] as String,
      frequency: json['frequency'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'frequency': frequency,
    };
  }
}
