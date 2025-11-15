import 'package:flutter/material.dart';

class ResidentPayment {
  final String id;
  final String doctorName;
  final String method;
  final String date;
  final String amount;

  const ResidentPayment({
    required this.id,
    required this.doctorName,
    required this.method,
    required this.date,
    required this.amount,
  });
}

class ResidentPaymentsPage extends StatelessWidget {
  const ResidentPaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: luego conectarás esto con tu capa de datos
    const residentName = 'Jorge Gonzales';
    const room = 'Habitación 305';

    final payments = const [
      ResidentPayment(
        id: '1',
        doctorName: 'Dra. María López',
        method: 'Tarjeta de crédito',
        date: '12 nov 2025',
        amount: 'S/ 250.00',
      ),
      ResidentPayment(
        id: '2',
        doctorName: 'Dr. Carlos Ramírez',
        method: 'Transferencia bancaria',
        date: '02 nov 2025',
        amount: 'S/ 180.00',
      ),
      ResidentPayment(
        id: '3',
        doctorName: 'Dra. María López',
        method: 'Tarjeta de débito',
        date: '20 oct 2025',
        amount: 'S/ 300.00',
      ),
    ];

    const primaryGreen = Color(0xFF00A38C);
    const background = Color(0xFFF2F5F8);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pagos',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjeta principal similar al header de Vitalia
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/resident_avatar.png', // o el asset que uses
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Info residente
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          residentName,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Residente  •  $room',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Historial de pagos realizados',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Historial de pagos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: payments.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final payment = payments[index];
                return _ResidentPaymentCard(payment: payment);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ResidentPaymentCard extends StatelessWidget {
  final ResidentPayment payment;

  const _ResidentPaymentCard({required this.payment});

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF00A38C);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.receipt_long,
                color: primaryGreen,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment.doctorName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${payment.method} • ${payment.date}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              payment.amount,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
