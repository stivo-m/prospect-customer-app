import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BottomNavigationItem {
  DASHBOARD,
  ORDERS,
  CHAT,
  SETTINGS,
}

List<BottomNavigationBarItem> bottomNavITems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    label: BottomNavigationItem.DASHBOARD.toString(),
    icon: Icon(Icons.dashboard),
  ),
  BottomNavigationBarItem(
    label: BottomNavigationItem.ORDERS.toString(),
    icon: Icon(Icons.sort),
  ),
  BottomNavigationBarItem(
    label: BottomNavigationItem.CHAT.toString(),
    icon: Icon(CupertinoIcons.chat_bubble),
  ),
  BottomNavigationBarItem(
    label: BottomNavigationItem.SETTINGS.toString(),
    icon: Icon(Icons.settings),
  ),
];
