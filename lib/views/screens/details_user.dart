import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gifts_app/views/screens/order_details.dart';
import 'package:gifts_app/views/screens/signIn.dart';

class DetailsUser extends StatefulWidget {
  static String savedPhone = '';
  const DetailsUser({super.key});

  @override
  State<DetailsUser> createState() => _DetailsUserState();
}

class _DetailsUserState extends State<DetailsUser> {


  late User? user;
  String phone = '';
  String? gender;



  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    phone = OrderDetails.savedPhone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff763498),
        centerTitle: true,
        title: Text(
          'User Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Email:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                if (user != null && user!.email != null)
                  Text(
                    user!.email!,
                    style: const TextStyle(fontSize: 18),
                  )
                else
                  const Text(
                    "not found",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Phone:",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  phone.isNotEmpty ? phone : "not found",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text("Gender", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                Text('Male' ,style: TextStyle(fontSize: 18)),
                SizedBox(width: 10),
                Radio<String>(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                Text('Female' , style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),


            SizedBox(height: 30,),

            SizedBox(
              width: double.infinity,
              child:
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
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
                      'Log Out',
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
