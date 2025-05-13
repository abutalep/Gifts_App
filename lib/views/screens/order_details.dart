import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  static String savedAddress = '';
  static String savedPhone = '';

  const OrderDetails({super.key});


  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double orderProgress = 0.5; //50%

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Order Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff763498),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order status', style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: orderProgress,
              backgroundColor: Colors.grey[300],
              color: Colors.blue,
              minHeight: 8,
            ),
            SizedBox(height: 8),
            Text('Your order is currently on the way to you.'),
            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Order Number',
                    style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.bold)),
                Text(' #${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}'
                  ,style: const TextStyle(fontSize: 18),),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaction Date',
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                Text('25/5/2025'
                  ,style: const TextStyle(fontSize: 18),),
              ],),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Deliver Address',
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

                Text(OrderDetails.savedAddress, style: const TextStyle(fontSize: 18)),
              ],),
            SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}