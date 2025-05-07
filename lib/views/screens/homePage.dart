import 'package:flutter/material.dart';
import 'package:gifts_app/views/functions/logOut.dart';
import 'package:gifts_app/views/widgets/home_appBar.dart';
import 'package:gifts_app/views/widgets/home_body.dart';
import 'package:gifts_app/views/widgets/home_bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeBody(),
    Center(child: Text('cart page')),
    Center(child: Text('profile page')),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onMenuSelected: (value) {
      setState(() {
        if (value == 'home') {
          _selectedIndex = 0;
        } else if (value == 'cart') {
          _selectedIndex = 1;
        } else if (value == 'profile') {
          _selectedIndex = 2;
        } else if (value == 'logout') {
          logoutUser(context);
        }
      });
    },
    onPressedCart: () {
      setState(() {
        _selectedIndex=1;
      });
    },
    ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: HomeBottomNavigationBar(
      selectedIndex: _selectedIndex,
      onItemTapped: (index) {
        setState(() {
         _selectedIndex = index;
        });
  },
),

    );
  }
}