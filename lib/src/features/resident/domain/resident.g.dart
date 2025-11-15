// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resident _$ResidentFromJson(Map<String, dynamic> json) => _Resident(
  id: json['id'] as String,
  fullName: json['fullName'] as String,
  age: (json['age'] as num).toInt(),
  photoUrl: json['photoUrl'] as String,
  status: json['status'] as String,
  lastUpdate: DateTime.parse(json['lastUpdate'] as String),
);

Map<String, dynamic> _$ResidentToJson(_Resident instance) => <String, dynamic>{
  'id': instance.id,
  'fullName': instance.fullName,
  'age': instance.age,
  'photoUrl': instance.photoUrl,
  'status': instance.status,
  'lastUpdate': instance.lastUpdate.toIso8601String(),
};
