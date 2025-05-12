import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/order_tracking.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  final Color _primaryColor = const Color(0xFF9C27B0);
  final String _phoneNumber = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: _primaryColor,
              size: 60,
            ),
            const SizedBox(height: 16),
            const Text(
              'Order Completed Successfully',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
                'Order Number: #${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'We will contact you on: $_phoneNumber',
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child:
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderTracking(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff763498),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(
                      'Tracking Order',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
