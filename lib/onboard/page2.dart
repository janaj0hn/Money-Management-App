//we have to modify the text in future
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:moneymanagementapp/ui/text/text.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
            Image.asset('assets/page2.png'),
            Text(
              'Be more fexibale and secure',
              style: KHeroBH,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'we are providing more secure',
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
