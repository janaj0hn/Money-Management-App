import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/login/register.dart';
import 'package:moneymanagementapp/screens/nav.dart';
import 'package:moneymanagementapp/ui/text/text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  final core = Get.find<Core>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              children: [
                Text(
                  'welcome back !',
                  style: KHeroBH,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              controller: TextEditingController(),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Enter your email',
                fillColor: Colors.black,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              obscureText: true,
              textAlign: TextAlign.center,
              controller: TextEditingController(),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined),
                  hintText: 'Enter your password',
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
                flex: 4,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                            Colors.purple[900],
                          )),
                          onPressed: () async {
                            print(email);
                            print(password);

                            try {
                              await _auth.signOut();
                              final newuser =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email.toString(),
                                      password: password.toString());
                              if (newuser != null) {
                                core.password = password.toString();
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Nav();
                                }));
                              } else {}
                            } catch (e) {
                              print('e');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Register();
                              },
                            ));
                          },
                          child: Text('register'))
                    ]))
          ])),
    )));
  }
}
