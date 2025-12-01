import 'package:freezed_annotation/freezed_annotation.dart';

part 'family_member.freezed.dart';
part 'family_member.g.dart';

@freezed
class FamilyMember with _$FamilyMember {
  const FamilyMember._();

  const factory FamilyMember({
    required int id,
    required String relationship,
    required int linkedResidentId,
    // Mapeamos el objeto anidado "fullName"
    required FamilyNameDto fullName,
    // El backend devuelve "userId": { "value": 9 }, extraemos el valor
    @JsonKey(fromJson: _userIdFromJson) required int userId,
    String? contactInfo,
  }) = _FamilyMember;

  // Helper para obtener nombre completo fácil
  String get displayName => '${fullName.firstName} ${fullName.lastName}';

  factory FamilyMember.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class FamilyNameDto with _$FamilyNameDto {
  const factory FamilyNameDto({
    required String firstName,
    required String lastName,
  }) = _FamilyNameDto;

  factory FamilyNameDto.fromJson(Map<String, dynamic> json) =>
      _$FamilyNameDtoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Función auxiliar para sacar el ID del objeto { "value": 9 }
int _userIdFromJson(dynamic json) {
  if (json is int) return json;
  if (json is Map<String, dynamic> && json.containsKey('value')) {
    return json['value'] as int;
  }
  return 0; // O lanzar excepción
}