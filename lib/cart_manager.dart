import 'package:flutter/material.dart';
import 'package:gifts_app/models/gift_model.dart';

class CartManager {
  final ValueNotifier<List<CartItem>> _items = ValueNotifier([]);
  ValueNotifier<List<CartItem>> get items => _items;

  void addItem(Gift product, [int quantity = 1]) {
    final currentItems = _items.value;
    final existingIndex = currentItems.indexWhere((item) => item.product.id == product.id);

    if (existingIndex >= 0) {
      currentItems[existingIndex].quantity += quantity;
      if (currentItems[existingIndex].quantity <= 0) {
        currentItems.removeAt(existingIndex);
      }
    } else if (quantity > 0) {
      currentItems.add(CartItem(product: product, quantity: quantity));
    }

    _items.value = [...currentItems];
  }

  void removeItem(String productId) {
    _items.value = _items.value.where((item) => item.product.id != productId).toList();
  }

  void updateQuantity(String productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(productId);
      return;
    }

    final currentItems = _items.value;
    final existingIndex = currentItems.indexWhere((item) => item.product.id == productId);

    if (existingIndex >= 0) {
      currentItems[existingIndex].quantity = newQuantity;
      _items.value = [...currentItems];
    }
  }

  void clearCart() {
    _items.value = [];
  }

  double get totalAmount {
    return _items.value.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  int get totalItems {
    return _items.value.fold(0, (sum, item) => sum + item.quantity);
  }

  void addToCart(Gift product) {
    addItem(product, 1);
  }
}

class CartItem {
  final Gift product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}

final cartManager = CartManager();