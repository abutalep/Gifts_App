// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final void Function() onPressedCart;
  final void Function(String) onMenuSelected;

   const HomeAppBar({super.key,required this.onMenuSelected,required this.onPressedCart});
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showMenu(
              context: context,
              position: const RelativeRect.fromLTRB(0, 80, 200, 100),
              items: const [
                PopupMenuItem(value: 'profile', child: Text('Profile')),
                PopupMenuItem(value: 'home', child: Text('Home')),
                PopupMenuItem(value: 'cart', child: Text('Cart')),
                PopupMenuItem(value: 'logout', child: Text('LogOut')),
              ],
            ).then((value) {
              if (value != null) {
                onMenuSelected.call(value);
              }
            });
            },
          ),
        ),
        title: Text(
          'Gifts App',
          style: TextStyle(
            color: Color(0xff944BBB),
            fontWeight: FontWeight.w700,
            fontSize: 26,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: 33,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: onPressedCart,
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      );
  }
  
  @override
  
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}