//we have to modify the text in future
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:moneymanagementapp/ui/text/text.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/page1.png'),
            Text(
              'Welcome to Budget Planner ',
              style: KHeroBH,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'make your monthly & yearly budget plan through digital.',
              style: Ksupersub,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    ));
  }
}
