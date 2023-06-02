import 'package:e_mart/views/bottomNavScreen/cart.dart';
import 'package:e_mart/views/bottomNavScreen/home.dart';
import 'package:e_mart/views/bottomNavScreen/profile.dart';
import 'package:e_mart/views/bottomNavScreen/campaign.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../consts/images.dart';
import '../../main.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List _pages = [HomePage(), Campaign(), Cart(), Profile()];
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: _currentindex,
        selectedFontSize: 16,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(icAnnoucement,height: mq.height * 0.04,),
            label: "Campaign",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: "Profile",
          ),
        ],
        onTap: (index){
          setState(() {
            _currentindex = index;
          });
        },
      ),
      body: _pages[_currentindex],
    );
  }
}
