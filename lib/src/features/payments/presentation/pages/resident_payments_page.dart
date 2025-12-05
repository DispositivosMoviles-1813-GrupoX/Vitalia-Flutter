import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../resident/application/resident_provider.dart';
import '../../application/receipts_providers.dart';
import '../../data/receipts_repository.dart';
import '../../data/dtos/create_receipt_request_dto.dart';
import '../../domain/receipt.dart';

class ResidentPaymentsPage extends ConsumerWidget {
  const ResidentPaymentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentAsync = ref.watch(residentProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagos'),
        elevation: 2,
      ),
      body: residentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (resident) {
          final receiptsAsync =
          ref.watch(receiptsByResidentProvider(resident.id));

          return receiptsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (receipts) => RefreshIndicator(
              onRefresh: () => ref
                  .refresh(receiptsByResidentProvider(resident.id).future),
              child: _PaymentsContent(
                residentId: resident.id,
                receipts: receipts,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreatePaymentSheet(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('Registrar pago'),
      ),
    );
  }

  Future<void> _showCreatePaymentSheet(
      BuildContext context, WidgetRef ref) async {
    final resident = await ref.read(residentProvider.future);
    final amountController = TextEditingController();
    final typeController = TextEditingController(text: 'Consulta médica');
    int paymentMethod = 0; // 0 tarjeta, 1 transferencia, 2 efectivo

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Registrar nuevo pago',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: amountController,
                keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Monto pagado (S/.)',
                  prefixIcon: Icon(Icons.payments_outlined),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: typeController,
                decoration: const InputDecoration(
                  labelText: 'Concepto / Tipo',
                  prefixIcon: Icon(Icons.description_outlined),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                value: paymentMethod,
                decoration: const InputDecoration(
                  labelText: 'Método de pago',
                  prefixIcon: Icon(Icons.credit_card),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 0,
                    child: Text('Tarjeta'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text('Transferencia'),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text('Efectivo'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    paymentMethod = value;
                  }
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final amount =
                    double.tryParse(amountController.text.trim());
                    if (amount == null || amount <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Ingresa un monto válido'),
                        ),
                      );
                      return;
                    }

                    final now = DateTime.now();

                    final dto = CreateReceiptRequestDto(
                      issueDate: now,
                      dueDate: now, // si manejas vencimiento, cámbialo aquí
                      totalAmount: amount,
                      status: true, // ya lo marcamos como pagado
                      residentId: resident.id,
                      paymentId: null,
                      paymentDate: now,
                      amountPaid: amount,
                      paymentMethod: paymentMethod,
                      type: typeController.text.trim(),
                    );

                    final repo =
                    ref.read(receiptsRepositoryProvider);

                    try {
                      await repo.createReceipt(dto);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Pago registrado correctamente'),
                          ),
                        );
                      }
                      // Refrescar historial
                      ref.invalidate(
                          receiptsByResidentProvider(resident.id));
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error registrando pago: $e'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text('Confirmar pago'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PaymentsContent extends StatelessWidget {
  final int residentId;
  final List<Receipt> receipts;

  const _PaymentsContent({
    required this.residentId,
    required this.receipts,
  });

  @override
  Widget build(BuildContext context) {
    if (receipts.isEmpty) {
      return ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          SizedBox(height: 40),
          Icon(Icons.payments_outlined, size: 60, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Aún no tienes pagos registrados.',
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    final formatter = NumberFormat.currency(
      locale: 'es_PE',
      symbol: 'S/ ',
    );

    final totalPaid =
    receipts.where((r) => r.isPaid).fold<double>(0, (sum, r) => sum + (r.amountPaid ?? 0));
    final totalPending = receipts
        .where((r) => !r.isPaid)
        .fold<double>(0, (sum, r) => sum + r.totalAmount);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _SummaryCard(
          totalPaid: totalPaid,
          totalPending: totalPending,
        ),
        const SizedBox(height: 16),
        const Text(
          'Historial de pagos',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 8),
        ...receipts.map((r) => _ReceiptTile(receipt: r, formatter: formatter)),
        const SizedBox(height: 80),
      ],
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final double totalPaid;
  final double totalPending;

  const _SummaryCard({
    required this.totalPaid,
    required this.totalPending,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(
      locale: 'es_PE',
      symbol: 'S/ ',
    );

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Total pagado',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(
                    formatter.format(totalPaid),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Pendiente',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(
                    formatter.format(totalPending),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReceiptTile extends StatelessWidget {
  final Receipt receipt;
  final NumberFormat formatter;

  const _ReceiptTile({
    required this.receipt,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    final color = receipt.isPaid
        ? Colors.green
        : receipt.isOverdue
        ? Colors.red
        : Colors.orange;

    final methodLabel = _paymentMethodLabel(receipt.paymentMethod);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(Icons.receipt_long, color: color),
        ),
        title: Text(
          receipt.type ?? 'Pago',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Fecha: ${DateFormat('dd/MM/yyyy').format(receipt.paymentDate ?? receipt.issueDate)}\n'
              'Método: $methodLabel',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatter.format(receipt.amountPaid ?? receipt.totalAmount),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                receipt.formattedStatus,
                style: TextStyle(
                  fontSize: 11,
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _paymentMethodLabel(int? method) {
    switch (method) {
      case 0:
        return 'Tarjeta';
      case 1:
        return 'Transferencia';
      case 2:
        return 'Efectivo';
      default:
        return 'Otro';
    }
  }
}
