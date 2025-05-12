import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/homePage.dart';

class MessageOrderTracking extends StatefulWidget {
  const MessageOrderTracking({super.key});

  @override
  State<MessageOrderTracking> createState() => _MessageOrderTrackingState();
}

class _MessageOrderTrackingState extends State<MessageOrderTracking> {
  final Color _primaryColor = const Color(0xFF9C27B0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Expanded(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(left: 10, top: 200),
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
                'Thank you for dealing with us ',
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
                'Continue shopping later',
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9C27B0),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue Shopping',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
