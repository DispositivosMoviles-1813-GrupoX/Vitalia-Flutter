import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';
part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const Doctor._();

  const factory Doctor({
    required int id,
    required String specialty,
    // Mapeamos el objeto "fullName" del JSON
    @JsonKey(name: 'fullName') required DoctorNameDto nameData,

    // Mapeamos el objeto "contactInfo" del JSON (puede ser null?)
    @JsonKey(name: 'contactInfo') DoctorContactDto? contactData,

    // Otros campos raíz
    String? licenseNumber,
    String? photoUrl,
    String? email,
  }) = _Doctor;

  // --- GETTERS INTELIGENTES ---
  // Esto permite que en tu UI sigas usando "doctor.firstName" sin romper nada
  String get firstName => nameData.firstName;
  String get lastName => nameData.lastName;
  String get fullName => '$firstName $lastName';
  String get phone => contactData?.phone ?? '';

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Clase auxiliar para el nombre anidado
@freezed
class DoctorNameDto with _$DoctorNameDto {
  const factory DoctorNameDto({
    required String firstName,
    required String lastName,
  }) = _DoctorNameDto;

  factory DoctorNameDto.fromJson(Map<String, dynamic> json) =>
      _$DoctorNameDtoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

// Clase auxiliar para el contacto anidado
@freezed
class DoctorContactDto with _$DoctorContactDto {
  const factory DoctorContactDto({
    String? phone,
    // se puede agregar 'address' aquí si se necesita luego
  }) = _DoctorContactDto;

  factory DoctorContactDto.fromJson(Map<String, dynamic> json) =>
      _$DoctorContactDtoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}