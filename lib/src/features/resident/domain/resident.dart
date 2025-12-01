import 'package:freezed_annotation/freezed_annotation.dart';

part 'resident.freezed.dart';
part 'resident.g.dart';

@freezed
class Resident with _$Resident {
  const Resident._();

  const factory Resident({
    required int id,
    String? dni,
    String? firstName,
    String? lastName,

    String? city,
    String? state,
    String? country,
    String? street,
    String? zipCode,
    String? gender,
    int? receiptId,
    // Usamos el converter para manejar "1990-05-11"
    @DateOnlyConverter() DateTime? birthDate,

    // Campos opcionales
    String? status,
    String? photoUrl,
  }) = _Resident;

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();

  // Getter útil para la UI
  String get fullAddress => '$street, $city, $state';

  factory Resident.fromJson(Map<String, dynamic> json) =>
      _$ResidentFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// convertidor de fechas
class DateOnlyConverter implements JsonConverter<DateTime?, String?> {
  const DateOnlyConverter();

  @override
  DateTime? fromJson(String? json) => json == null ? null : DateTime.parse(json);

  @override
  String? toJson(DateTime? object) {
    if (object == null) return null;
    return '${object.year.toString().padLeft(4, '0')}-'
        '${object.month.toString().padLeft(2, '0')}-'
        '${object.day.toString().padLeft(2, '0')}';
  }
}