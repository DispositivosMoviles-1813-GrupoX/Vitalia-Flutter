import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_receipt_request_dto.freezed.dart';
part 'create_receipt_request_dto.g.dart';

@freezed
class CreateReceiptRequestDto with _$CreateReceiptRequestDto {
  const factory CreateReceiptRequestDto({
    required DateTime issueDate,
    required DateTime dueDate,
    required double totalAmount,
    required bool status,
    required int residentId,
    int? paymentId,
    DateTime? paymentDate,
    double? amountPaid,
    int? paymentMethod,
    String? type,
  }) = _CreateReceiptRequestDto;

  factory CreateReceiptRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateReceiptRequestDtoFromJson(json);

  // Mismo truco que en CreateAppointmentRequestDto
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
