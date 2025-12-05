import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/receipt.dart';
import '../data/receipts_repository.dart';

final receiptsByResidentProvider =
FutureProvider.family<List<Receipt>, int>((ref, residentId) async {
  final repo = ref.watch(receiptsRepositoryProvider);
  return repo.getReceiptsByResident(residentId);
});

final receiptByIdProvider =
FutureProvider.family<Receipt?, int>((ref, receiptId) async {
  final repo = ref.watch(receiptsRepositoryProvider);
  return repo.getReceiptById(receiptId);
});
