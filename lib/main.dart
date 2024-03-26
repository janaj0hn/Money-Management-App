import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/firebase_options.dart';
import 'package:moneymanagementapp/onboard/onboardingscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  Core core = Core();
  Get.put(core);
  runApp(MoneyM());
}

class MoneyM extends StatelessWidget {
  const MoneyM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.black)),
      home: Onboardingscreen(),
    );
  }
}
