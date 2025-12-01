class MentalHealthRecord {
  final int? id;
  final DateTime date;
  final String diagnosis;
  final String treatment;

  MentalHealthRecord({
    this.id,
    required this.date,
    required this.diagnosis,
    required this.treatment,
  });

  factory MentalHealthRecord.fromJson(Map<String, dynamic> json) {
    return MentalHealthRecord(
      id: json['id'] as int?,
      date: DateTime.parse(json['date']),
      diagnosis: json['diagnosis'] as String,
      treatment: json['treatment'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diagnosis': diagnosis,
      'treatment': treatment,
    };
  }
}
