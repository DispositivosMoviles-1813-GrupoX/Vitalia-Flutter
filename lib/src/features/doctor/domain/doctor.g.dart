// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Doctor _$DoctorFromJson(Map<String, dynamic> json) => _Doctor(
  id: (json['id'] as num).toInt(),
  specialty: json['specialty'] as String,
  nameData: DoctorNameDto.fromJson(json['fullName'] as Map<String, dynamic>),
  contactData: json['contactInfo'] == null
      ? null
      : DoctorContactDto.fromJson(json['contactInfo'] as Map<String, dynamic>),
  licenseNumber: json['licenseNumber'] as String?,
  photoUrl: json['photoUrl'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$DoctorToJson(_Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'specialty': instance.specialty,
  'fullName': instance.nameData,
  'contactInfo': instance.contactData,
  'licenseNumber': instance.licenseNumber,
  'photoUrl': instance.photoUrl,
  'email': instance.email,
};

_DoctorNameDto _$DoctorNameDtoFromJson(Map<String, dynamic> json) =>
    _DoctorNameDto(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$DoctorNameDtoToJson(_DoctorNameDto instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

_DoctorContactDto _$DoctorContactDtoFromJson(Map<String, dynamic> json) =>
    _DoctorContactDto(phone: json['phone'] as String?);

Map<String, dynamic> _$DoctorContactDtoToJson(_DoctorContactDto instance) =>
    <String, dynamic>{'phone': instance.phone};
