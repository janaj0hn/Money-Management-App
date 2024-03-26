import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/ui/text/text.dart';

enum typeenum { income, expense }

class ExpenseINput extends StatefulWidget {
  const ExpenseINput({super.key});

  @override
  State<ExpenseINput> createState() => _ExpenseINputState();
}

class _ExpenseINputState extends State<ExpenseINput> {
  TextEditingController amountEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController desEditingController = TextEditingController();

  typeenum? _typeEnum;

  final core = Get.find<Core>();
  String? textHead;
  String? hinttext;
  String selectedCategory = 'rent';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            'Add Transaction',
            style: Kbody,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Text('enter the title'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: nameEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'title',
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('enter the amount'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: amountEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'amount',
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('enter the description (op)'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                  controller: desEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'description',
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Transaction type'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: RadioListTile<typeenum>(
                          value: typeenum.income,
                          groupValue: _typeEnum,
                          title: Text('income'),
                          onChanged: (val) {
                            setState(() {
                              _typeEnum = val;
                            });
                          })),
                  Expanded(
                      child: RadioListTile<typeenum>(
                          value: typeenum.expense,
                          title: Text('expense'),
                          groupValue: _typeEnum,
                          onChanged: (val) {
                            setState(() {
                              _typeEnum = val;
                            });
                          })),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  core.addTransaction(
                      _typeEnum,
                      int.parse(amountEditingController.text),
                      nameEditingController.text,
                      desEditingController.text);

                  Navigator.of(context).pop();
                },
                child: Text('data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
