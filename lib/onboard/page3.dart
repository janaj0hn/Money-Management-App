//we have to modify the text in future
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:moneymanagementapp/ui/text/text.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
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
            // Image.asset('images/page3.png'),
            Text(
              'Be easier to manage your own money with us ',
              style: KHeroBH,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'worry less, do more',
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
