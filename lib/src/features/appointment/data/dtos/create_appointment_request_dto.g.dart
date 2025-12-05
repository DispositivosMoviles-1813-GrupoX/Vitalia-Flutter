// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAppointmentRequestDto _$CreateAppointmentRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateAppointmentRequestDto(
  residentId: (json['residentId'] as num).toInt(),
  doctorId: (json['doctorId'] as num).toInt(),
  date: const DateOnlyJsonConverter().fromJson(json['date'] as String),
  time: const TimeOnlyJsonConverter().fromJson(json['time'] as String),
  status: json['status'] as String,
);

Map<String, dynamic> _$CreateAppointmentRequestDtoToJson(
  _CreateAppointmentRequestDto instance,
) => <String, dynamic>{
  'residentId': instance.residentId,
  'doctorId': instance.doctorId,
  'date': const DateOnlyJsonConverter().toJson(instance.date),
  'time': const TimeOnlyJsonConverter().toJson(instance.time),
  'status': instance.status,
};
