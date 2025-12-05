import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

@freezed
class Appointment with _$Appointment {
  const Appointment._();

  const factory Appointment({
    required int id,
    required int residentId,
    required int doctorId,
    @JsonKey(name: 'date') @DateOnlyJsonConverter() required DateTime date,
    @JsonKey(name: 'time') @TimeOnlyJsonConverter() required AppointmentTime time,
    required String status,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class AppointmentTime with _$AppointmentTime {
  const factory AppointmentTime({
    required int hour,
    required int minute,
    required int second,
    required int nano,
  }) = _AppointmentTime;

  factory AppointmentTime.fromJson(Map<String, dynamic> json) => _$AppointmentTimeFromJson(json);


  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class DateOnlyJsonConverter implements JsonConverter<DateTime, String> {
  const DateOnlyJsonConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime object) {
    return DateFormat('yyyy-MM-dd').format(object);
  }
}

class TimeOnlyJsonConverter implements JsonConverter<AppointmentTime, String> {
  const TimeOnlyJsonConverter();

  @override
  AppointmentTime fromJson(String json) {
    // La deserialización (lectura del backend) está bien si envía HH:mm:ss o HH:mm
    final parts = json.split(':');
    return AppointmentTime(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
      second: parts.length > 2 ? int.parse(parts[2]) : 0,
      nano: 0,
    );
  }

  @override
  String toJson(AppointmentTime object) {
    // CAMBIO CLAVE: Quitamos los segundos y dejamos solo HH:mm
    final h = object.hour.toString().padLeft(2, '0');
    final m = object.minute.toString().padLeft(2, '0');

    // El formato esperado por Java LocalTime es HH:mm (ej: "16:44")
    return "$h:$m";
  }
}