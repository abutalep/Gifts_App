import 'package:flutter/material.dart';
import 'package:gifts_app/models/gift_model.dart';

class AddToCart extends StatefulWidget {
  Gift gift;
  AddToCart({super.key,required this.gift});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isAddedToCart = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
  top: 8,
  right: 8,
  child: GestureDetector(
    onTap: () {
      setState(() {
        isAddedToCart = true;
      });
      cartGifts.add(widget.gift);
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          setState(() {
            isAddedToCart = false;
          });
        }
      });
    },
    child: Icon(
      isAddedToCart ? Icons.check : Icons.add_shopping_cart,
      size: 22,
      color: isAddedToCart ? Colors.green : const Color(0xff944BBB),
    ),
  ),
);
  }
}