import 'package:flutter/material.dart';

import 'package:moneymanagementapp/onboard/page1.dart';
import 'package:moneymanagementapp/onboard/page2.dart';
import 'package:moneymanagementapp/onboard/page3.dart';
import 'package:moneymanagementapp/screens/username.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  bool onLastpage = false;
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastpage = (index == 2);
              });
            },
            scrollDirection: Axis.horizontal,
            controller: _controller,
            children: [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text('jump'.toUpperCase()),
                ),
                SmoothPageIndicator(
                    effect: WormEffect(), controller: _controller, count: 3),
                onLastpage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return UserName();
                          }));
                        },
                        child: Text(
                          'Lets Go'.toUpperCase(),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text('next'.toUpperCase()),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
