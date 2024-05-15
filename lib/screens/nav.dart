import 'package:flutter/widgets.dart';
import 'package:moneymanagementapp/chat-bot/chat-brain.dart';

import 'package:moneymanagementapp/screens/dashboard.dart';
import 'package:moneymanagementapp/screens/sharetracker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentindex = 0;

  final screens = [DashBoardScreen(), SharetrackerScreen(), Home()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentindex],
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) {
              setState(() {
                currentindex = index;
              });
            },
            selectedIndex: currentindex,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: 'dashboard',
                selectedIcon: Icon(Icons.home),
              ),
              NavigationDestination(
                  selectedIcon: Icon(Icons.swap_calls_outlined),
                  icon: Icon(Icons.swap_calls_outlined),
                  label: 'StockTracker'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.support_agent_outlined),
                  icon: Icon(Icons.support_agent_outlined),
                  label: 'support'),
            ]),
      ),
    );
  }
}
