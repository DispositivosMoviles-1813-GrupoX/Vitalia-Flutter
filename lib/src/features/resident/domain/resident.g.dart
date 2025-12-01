// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resident _$ResidentFromJson(Map<String, dynamic> json) => _Resident(
  id: (json['id'] as num).toInt(),
  dni: json['dni'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  country: json['country'] as String?,
  street: json['street'] as String?,
  zipCode: json['zipCode'] as String?,
  gender: json['gender'] as String?,
  receiptId: (json['receiptId'] as num?)?.toInt(),
  birthDate: const DateOnlyConverter().fromJson(json['birthDate'] as String?),
  status: json['status'] as String?,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$ResidentToJson(_Resident instance) => <String, dynamic>{
  'id': instance.id,
  'dni': instance.dni,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'street': instance.street,
  'zipCode': instance.zipCode,
  'gender': instance.gender,
  'receiptId': instance.receiptId,
  'birthDate': const DateOnlyConverter().toJson(instance.birthDate),
  'status': instance.status,
  'photoUrl': instance.photoUrl,
};
