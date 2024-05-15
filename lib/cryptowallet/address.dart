import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/ui/text/text.dart';
import 'package:web3dart/web3dart.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String? address;
  double? amount;
  Core core = Get.find<Core>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          foregroundColor: Colors.white,
          title: Text(
            'data',
            style: Kbody,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: TextEditingController(),
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'address')),
              SizedBox(
                height: 30,
              ),
              TextField(
                  onChanged: (value) {
                    amount = double.parse(value);
                  },
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'amount')),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('transaction successful')));
                  print(address);
                  print(amount);
                  final hash = await core.web3client.sendTransaction(
                    core.wallet.value!.privateKey,
                    Transaction(
                      from: core.wallet.value!.privateKey.address,
                      to: EthereumAddress.fromHex(address!),
                      value: EtherAmount.fromBigInt(
                        EtherUnit.wei,
                        BigInt.from(
                          amount! * pow(10, 18),
                        ),
                      ),
                    ),
                    chainId: 1337,
                  );
                  print("Transaction submitted $hash");
                },
                child: Text('confirm'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
