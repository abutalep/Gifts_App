// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gifts_app/models/gift_model.dart';
import 'package:gifts_app/cart_manager.dart';

class AddToCart extends StatefulWidget {
  final Gift gift;
  const AddToCart({super.key, required this.gift});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool _isInCart = false;

  @override
  void initState() {
    super.initState();
    _checkIfInCart();
  }

  void _checkIfInCart() {
    setState(() {
      _isInCart = cartManager.items.value.any((item) => item.product.id == widget.gift.id);
    });
  }

  void _toggleCartStatus() {
    setState(() {
      if (_isInCart) {
        cartManager.removeItem(widget.gift.id);
      } else {
        cartManager.addToCart(widget.gift);
      }
      _isInCart = !_isInCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 8,
      child: GestureDetector(
        onTap: _toggleCartStatus,
        child: Icon(
          _isInCart ? Icons.check : Icons.add_shopping_cart,
          size: 22,
          color: _isInCart ? Colors.green : const Color(0xff944BBB),
        ),
      ),
    );
  }
}