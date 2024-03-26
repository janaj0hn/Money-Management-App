import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/ui/text/text.dart';

class TotalAmount extends StatefulWidget {
  const TotalAmount({
    super.key,
  });

  @override
  State<TotalAmount> createState() => _TotalAmountState();
}

class _TotalAmountState extends State<TotalAmount> {
  final core = Get.find<Core>();
  TextEditingController _amount = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(
            'Add budget',
            style: Kbody,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            children: [
              TextField(
                controller: _amount,
                decoration: InputDecoration(
                  hintText: 'amount',
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  print(_amount.text);
                  core.balance.value = int.parse(_amount.text);
                  Navigator.of(context).pop();
                },
                child: Text('ADD'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
