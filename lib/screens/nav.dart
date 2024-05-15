import 'package:flutter/widgets.dart';
import 'package:moneymanagementapp/Cryptopricetracker/api.dart';
import 'package:moneymanagementapp/chat-bot/chat-brain.dart';

import 'package:moneymanagementapp/cryptowallet/cryptowallet.dart';

import 'package:moneymanagementapp/screens/dashboard.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentindex = 0;

  final screens = [DashBoardScreen(), ApiScreen(), Home(), CryptoWallet()];
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
                  label: 'apiTracker'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.support_agent_outlined),
                  icon: Icon(Icons.support_agent_outlined),
                  label: 'support'),
              NavigationDestination(
                  selectedIcon: Icon(Icons.currency_rupee_outlined),
                  icon: Icon(Icons.currency_rupee_outlined),
                  label: 'Wallet'),
            ]),
      ),
    );
  }
}
