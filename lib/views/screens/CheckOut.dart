// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/details_user.dart';
import 'package:gifts_app/views/screens/order_details.dart';
import 'package:gifts_app/views/screens/payment.dart';


class Checkout extends StatefulWidget {
  final double totalPrice;
  const Checkout({super.key, required this.totalPrice});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  String _address = '';
  String _phoneNumber = '';
  String _paymentMethod = 'Credit Card';
  final Color _primaryColor = const Color(0xFF9C27B0);
  final Color _primaryLightColor = const Color(0xFFE1BEE7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CheckOut',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: _primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,
          controlsBuilder: (context, details) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  if (_currentStep != 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: Text(
                        'BACK',
                        style: TextStyle(color: _primaryColor),
                      ),
                    ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: details.onStepContinue,
                    child: Text(
                      _currentStep == 2 ? 'VERIFY & PAY' : 'NEXT',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          onStepContinue: () {
            if (_currentStep == 0) {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState!.save();
            }
            if (_currentStep < 2) {
              setState(() => _currentStep += 1);
            } else {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _placeOrder();
              }
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() => _currentStep -= 1);
            }
          },
          steps: [
            Step(
              title: const Text('Delivery Details'),
              content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Add your address',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onSaved: (value) => _address = value!,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '01XXXXXXXX',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _primaryColor),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^01[0-9]{9}$').hasMatch(value)) {
                        return 'Please enter a valid Egyptian phone number';
                      }
                      return null;
                    },
                    onSaved: (value) => _phoneNumber = value!,
                  ),
                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Payment Method'),
              content: Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Credit Card'),
                    value: 'Credit Card',
                    groupValue: _paymentMethod,
                    activeColor: _primaryColor,
                    onChanged: (value) {
                      setState(() => _paymentMethod = value!);
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Electronic wallets'),
                    value: 'Electronic Wallet',
                    groupValue: _paymentMethod,
                    activeColor: _primaryColor,
                    onChanged: (value) {
                      setState(() => _paymentMethod = value!);
                    },
                  ),
                ],
              ),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: const Text('Confirm Order'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _primaryLightColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _primaryLightColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address: $_address',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Phone: $_phoneNumber',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('Payment Method: $_paymentMethod',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _primaryLightColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.purple),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Order confirmation will be sent to your email and phone.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              isActive: _currentStep >= 2,
            ),
          ],
        ),

      ),

    );
  }

  void _placeOrder() {
    DetailsUser.savedPhone = _phoneNumber;
    OrderDetails.savedPhone = _phoneNumber;
    OrderDetails.savedAddress = _address;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Payment(totalPrice: widget.totalPrice,)),
    );
  }

}
