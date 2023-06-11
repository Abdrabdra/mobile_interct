import 'package:flutter/material.dart';

// bottomNavItems
List<BottomNavigationBarItem> navItems = const [
  BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        // size: 18,
      ),
      label: 'Home'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
        // size: 18,
      ),
      label: 'Laiks'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.add_circle,
        // size: 18,
      ),
      label: ''),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.mode_comment,
        textDirection: TextDirection.rtl,
        // size: 18,
      ),
      label: 'Coobwenie'),
  BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle,
        // size: 18,
      ),
      label: 'Profile'),
];
