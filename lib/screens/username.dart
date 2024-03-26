import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/screens/dashboard.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  TextEditingController _nameEditingController = TextEditingController();

  final core = Get.find<Core>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _nameEditingController,
                decoration: InputDecoration(hintText: 'name'),
              ),
              GestureDetector(
                  onTap: () {
                    core.name.value = _nameEditingController.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DashBoardScreen();
                    }));
                  },
                  child: Text('create'))
            ],
          ),
        ),
      ),
    );
  }
}
