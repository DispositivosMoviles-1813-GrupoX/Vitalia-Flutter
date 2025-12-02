class MedicalHistory {
  final int? id;
  final DateTime recordDate;
  final String diagnosis;
  final String treatment;

  MedicalHistory({
    this.id,
    required this.recordDate,
    required this.diagnosis,
    required this.treatment,
  });

  // Un factory constructor para crear una instancia desde un JSON (mapa)
  factory MedicalHistory.fromJson(Map<String, dynamic> json) {
    return MedicalHistory(
      id: json['id'] as int?,
      recordDate: DateTime.parse(json['recordDate']),
      diagnosis: json['diagnosis'] as String,
      treatment: json['treatment'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diagnosis': diagnosis,
      'treatment': treatment,
      // 'recordDate' is usually set by backend, but if needed:
      // 'recordDate': recordDate.toIso8601String(),
    };
  }
}