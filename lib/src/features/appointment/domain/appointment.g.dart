// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
  id: (json['id'] as num).toInt(),
  residentId: (json['residentId'] as num).toInt(),
  doctorId: (json['doctorId'] as num).toInt(),
  date: const DateOnlyJsonConverter().fromJson(json['date'] as String),
  time: const TimeOnlyJsonConverter().fromJson(json['time'] as String),
  status: json['status'] as String,
);

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'residentId': instance.residentId,
      'doctorId': instance.doctorId,
      'date': const DateOnlyJsonConverter().toJson(instance.date),
      'time': const TimeOnlyJsonConverter().toJson(instance.time),
      'status': instance.status,
    };

_AppointmentTime _$AppointmentTimeFromJson(Map<String, dynamic> json) =>
    _AppointmentTime(
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
      second: (json['second'] as num).toInt(),
      nano: (json['nano'] as num).toInt(),
    );

Map<String, dynamic> _$AppointmentTimeToJson(_AppointmentTime instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
      'second': instance.second,
      'nano': instance.nano,
    };
