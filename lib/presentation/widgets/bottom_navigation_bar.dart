
import 'package:flutter/material.dart';

import '../pages/home/home.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems = const [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
  ),
  BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notifications',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];

List<Widget> bottomNavigationBarPages = <Widget> [
  HomePage(),
  Text('Index 1 : Cart'),
  Text('Index 2 : Notification'),
  Text('Index 3 : Profile')
];