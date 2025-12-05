import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/appointment.dart';

part 'create_appointment_request_dto.freezed.dart';
part 'create_appointment_request_dto.g.dart';

@freezed
class CreateAppointmentRequestDto with _$CreateAppointmentRequestDto {
  const factory CreateAppointmentRequestDto({
    required int residentId,
    required int doctorId,
    @DateOnlyJsonConverter() required DateTime date,
    @TimeOnlyJsonConverter() required AppointmentTime time,
    required String status,
  }) = _CreateAppointmentRequestDto;

  factory CreateAppointmentRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAppointmentRequestDtoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
