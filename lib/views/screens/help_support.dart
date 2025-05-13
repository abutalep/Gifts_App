import 'package:flutter/material.dart';
import 'package:gifts_app/views/functions/showSnackBarFunction.dart';

// ignore: must_be_immutable
class HelpSupport extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  HelpSupport({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        'question': 'How to use gift card?',
        'answer':
        'You can use the gift card during checkout by entering the code.',
      },
      {
        'question': 'Where is my order?',
        'answer': 'You can track your order status in the Orders section.',
      },
      {
        'question': 'Return policy',
        'answer': 'Items can be returned within 30 days of purchase.',
      },
      {
        'question': 'How to track my order?',
        'answer': 'Tracking info will be available in your Orders page.',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff763498),
        title: Text(
          'Help & Support',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact us',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              'Email',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'contact@shop.com',
                  style: TextStyle(color: Colors.blueGrey),
                ),

                IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
              ],
            ),
            SizedBox(height: 10),

            Text(
              'Phone',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '+20 010111258963',
                  style: TextStyle(color: Colors.blueGrey),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.copy)),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Send us a message",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(hintText: 'Your message'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff944BBB),
                      minimumSize: Size(double.infinity, 40),
                    ),
                    onPressed: () {
                      final text = nameController.text.trim();
                          if (formKey.currentState!.validate()) {
                            if (text.isNotEmpty) {
                              showSnackBar_Function(context,
                                  text: 'Request sent to the store!');
                              nameController.clear();
                            } else {
                              showSnackBar_Function(context, text: 'Message is empty !');
                            }
                          }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Send to Store',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.send, color: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'FAQs',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ...faqs.map((faq) {
              return Column(
                children: [
                  ExpansionTile(
                    title: Text(faq['question']!),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 1,
                        ),
                        child: Text(faq['answer']!),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}