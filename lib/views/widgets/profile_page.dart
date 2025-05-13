import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/details_user.dart';
import 'package:gifts_app/views/screens/help_support.dart';
import 'package:gifts_app/views/screens/order_details.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("Profile Page " ,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          backgroundColor: Color(0xff763498)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Account settings',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Details '),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => DetailsUser()));
              },
            ),
            ListTile(
              title: const Text('Saved addresses'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => OrderDetails()));
              },
            ),
            const SizedBox(height: 30),
            ListTile(
              title: const Text(
                'Help & Support',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => HelpSupport()));
              },
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}