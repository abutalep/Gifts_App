import 'package:flutter/material.dart';
import 'package:gifts_app/cart_manager.dart';
import 'package:gifts_app/views/screens/order_confirm.dart';

class Payment extends StatefulWidget {
  final double totalPrice;
  const Payment({super.key, required this.totalPrice});


  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _type = 0;
  TextEditingController promoController = TextEditingController();
  TextEditingController walletNumberController = TextEditingController();
  bool promoApplied = false;
  bool promoInvalid = false;

  void _handleRadio(Object? e) => setState(() {
    _type = e as int;
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff763498),
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 5),
            Text("Select Payment Method", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),

            // Visa
            buildOption("Visa xxxx" ,icon: Icon(Icons.credit_card, color: Colors.blue),1 ),
            SizedBox(height: 10),

            // Promo Code
            if (_type == 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Promo Code",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: promoController,
                              decoration: InputDecoration(
                                hintText: 'Enter promo code ',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        promoApplied
                            ? Icon(Icons.check_circle, color: Colors.blueGrey)
                            : IconButton(
                          onPressed: () {
                            setState(() {
                              if (promoController.text.trim().isNotEmpty) {
                                if (promoController.text.trim() ==
                                    'VALIDCODE') {
                                  promoApplied = true;
                                  promoInvalid = false;
                                } else {
                                  promoInvalid = true;
                                }
                              }
                            });
                          },
                          icon: Icon(Icons.check_circle),
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                  if (promoInvalid)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text(
                          'Invalid promo code!',
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                    ),
                ],
              ),

            SizedBox(height: 20),
            if (_type == 1 || _type == 2)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter Your Credit Card :',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: walletNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Eg. xxxxxxxxxxxxxxxx',
                      ),

                    ),
                  ],
                ),
              ),

            // Wallets Section
            Text(
              "Wallets",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            buildOption(
              'Vodafone Cash',
              4,
              icon: Icon(Icons.account_balance_wallet, color: Colors.red),
            ),
            SizedBox(height: 10),
            buildOption(
              'Etisalat Cash',
              5,
              icon: Icon(Icons.account_balance_wallet, color: Colors.green),
            ),
            SizedBox(height: 10),
            buildOption(
              'Orange Money',
              6,
              icon: Icon(Icons.account_balance_wallet, color: Colors.orange),
            ),
            SizedBox(height: 10),

            if (_type == 4 || _type == 5 || _type == 6)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(_type==4)
                    Text(
                      'Pay the money to : 0103255555555',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    else if(_type==5)
                    Text(
                      'Pay the money to : 0113255555555',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                    else if(_type==6)
                    Text(
                      'Pay the money to : 0123255555555',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Enter Wallet Number:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: walletNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Eg. 01xxxxxxxxx',
                      ),

                    ),
                  ],
                ),
              ),

            SizedBox(height: 10),
            Divider(),

            // Total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey)),

                Text(
                  '${widget.totalPrice} EGP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),

              ],
            ),

            SizedBox(height: 30),

            // Confirm Button
            InkWell(
              onTap: () {
                if ((_type == 4 || _type == 5 || _type == 6) &&
                    walletNumberController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter wallet number')),
                  );
                  return;
                }
                if ((_type == 1 || _type == 2) &&
                    walletNumberController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter Credit cart')),
                  );
                  return;
                }

                cartManager.items.value=[];
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>OrderConfirm()));
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
                    'Confirm Payment',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOption(String label, int value, {Widget? icon}) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        border:
        _type == value
            ? Border.all(width: 1, color: Colors.black)
            : Border.all(width: 0.3, color: Colors.black),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: icon,
                    ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 15,
                      color: _type == value ? Colors.black : Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              Radio(
                value: value,
                groupValue: _type,
                onChanged: _handleRadio,
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
