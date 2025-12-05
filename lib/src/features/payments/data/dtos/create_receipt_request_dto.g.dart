// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_receipt_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateReceiptRequestDto _$CreateReceiptRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateReceiptRequestDto(
  issueDate: DateTime.parse(json['issueDate'] as String),
  dueDate: DateTime.parse(json['dueDate'] as String),
  totalAmount: (json['totalAmount'] as num).toDouble(),
  status: json['status'] as bool,
  residentId: (json['residentId'] as num).toInt(),
  paymentId: (json['paymentId'] as num?)?.toInt(),
  paymentDate: json['paymentDate'] == null
      ? null
      : DateTime.parse(json['paymentDate'] as String),
  amountPaid: (json['amountPaid'] as num?)?.toDouble(),
  paymentMethod: (json['paymentMethod'] as num?)?.toInt(),
  type: json['type'] as String?,
);

Map<String, dynamic> _$CreateReceiptRequestDtoToJson(
  _CreateReceiptRequestDto instance,
) => <String, dynamic>{
  'issueDate': instance.issueDate.toIso8601String(),
  'dueDate': instance.dueDate.toIso8601String(),
  'totalAmount': instance.totalAmount,
  'status': instance.status,
  'residentId': instance.residentId,
  'paymentId': instance.paymentId,
  'paymentDate': instance.paymentDate?.toIso8601String(),
  'amountPaid': instance.amountPaid,
  'paymentMethod': instance.paymentMethod,
  'type': instance.type,
};
