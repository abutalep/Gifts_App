import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/order_details.dart';
import 'package:gifts_app/views/screens/order_tracking.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  String phone = '';
  final Color _primaryColor = const Color(0xFF9C27B0);
  final String _orderNumber = DateTime.now().millisecondsSinceEpoch.toString().substring(6);
  final String _trackingNumber = 'TRK${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';

  @override
  void initState() {
    super.initState();
    phone = OrderDetails.savedPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: _primaryColor, size: 60),
            const SizedBox(height: 16),
            const Text(
              'Order Completed Successfully',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Order Number: #$_orderNumber',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'We will contact you on:  ',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                Text(
                  phone.isNotEmpty ? phone : "not found",
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OrderTracking(
                        deliveryAddress: OrderDetails.savedAddress,
                        orderNumber: _orderNumber,
                        trackingNumber: _trackingNumber,
                      ),
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
                      'Track Order',
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