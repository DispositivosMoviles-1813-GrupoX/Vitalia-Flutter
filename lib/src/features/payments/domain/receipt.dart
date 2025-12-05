import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt.freezed.dart';
part 'receipt.g.dart';

@freezed
class Receipt with _$Receipt {
  const Receipt._(); // para tener getters personalizados

  const factory Receipt({
    required int receiptId,
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
  }) = _Receipt;

  factory Receipt.fromJson(Map<String, dynamic> json) =>
      _$ReceiptFromJson(json);

  bool get isPaid => status;

  bool get isOverdue => !isPaid && DateTime.now().isAfter(dueDate);

  String get formattedStatus {
    if (isPaid) return 'Pagado';
    if (isOverdue) return 'Vencido';
    return 'Pendiente';
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
