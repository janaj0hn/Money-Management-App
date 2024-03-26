// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:moneymanagementapp/login/login.dart';
// import 'package:moneymanagementapp/screens/dashboard.dart';

// class Register extends StatefulWidget {
//   const Register({super.key});

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   final _auth = FirebaseAuth.instance;
//   String? email;
//   String? password;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextField(
//                     onChanged: (value) {
//                       email = value;
//                     },
//                     textAlign: TextAlign.center,
//                     keyboardType: TextInputType.emailAddress,
//                     controller: TextEditingController(),
//                     decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.email_outlined),
//                       hintText: 'Enter your email',
//                       fillColor: Colors.black,
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(10))),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   TextField(
//                     onChanged: (value) {
//                       password = value;
//                     },
//                     obscureText: true,
//                     textAlign: TextAlign.center,
//                     controller: TextEditingController(),
//                     decoration: InputDecoration(
//                         hintText: 'Enter your password',
//                         fillColor: Colors.black,
//                         prefixIcon: Icon(Icons.lock_outlined),
//                         border: OutlineInputBorder(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(10)))),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Expanded(
//                     flex: 4,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         TextButton(
//                             style: ButtonStyle(
//                                 backgroundColor: MaterialStatePropertyAll(
//                               Colors.purple[900],
//                             )),
//                             onPressed: () async {
//                               print(email);
//                               print(password);

//                               try {
//                                 final newuser =
//                                     await _auth.createUserWithEmailAndPassword(
//                                         email: email.toString(),
//                                         password: password.toString());

//                                 if (newuser != null) {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (context) {
//                                     return DashBoardScreen();
//                                   }));
//                                 } else {}
//                               } catch (e) {
//                                 print('e');
//                               }
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child: Text(
//                                 'Sign In',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             )),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: (context) {
//                                 return Login();
//                               }));
//                             },
//                             child: Text('Login'))
//                       ],
//                     ),
//                   ),
//                 ],
//               ))),
//     );
//   }
// }
