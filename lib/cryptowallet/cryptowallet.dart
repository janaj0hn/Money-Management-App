// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/cryptowallet/address.dart';
import 'package:moneymanagementapp/ui/text/text.dart';
import 'package:web3dart/web3dart.dart';

class CryptoWallet extends StatefulWidget {
  CryptoWallet({super.key});

  @override
  State<CryptoWallet> createState() => _CryptoWalletState();
}

class _CryptoWalletState extends State<CryptoWallet> {
  final core = Get.find<Core>();
  bool loading = true;
  double ethBalance = 0.0;
  Timer? balaneTimer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    core.checkWalletExist().then((value) {
      fetchBalance();
      setState(() {
        loading = false;
      });
    });
  }

  fetchBalance() async {
    if (core.wallet.value != null) {
      if (balaneTimer != null) {
        if (balaneTimer!.isActive) {
          balaneTimer!.cancel();
          balaneTimer = null;
        }
      }
      balaneTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
        final balance = await core.web3client
            .getBalance(core.wallet.value!.privateKey.address);
        setState(() {
          ethBalance = balance.getValueInUnit(EtherUnit.ether);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            foregroundColor: Colors.white,
            title: Text(
              'cryptowallet',
              style: Kbody,
            ),
          ),
          body: Column(
            children: [
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Obx(
                      () => Container(
                        child: core.wallet.value == null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    core.createWallet();
                                  },
                                  child: Text('create wallet'),
                                ),
                              )
                            : Center(
                                child: InkWell(
                                  onTap: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text: core.wallet.value!.privateKey
                                            .address.hex));
                                    print(core
                                        .wallet.value!.privateKey.address.hex);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                        "Public address copied",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.green,
                                    ));
                                  },
                                  child: Text(core
                                      .wallet.value!.privateKey.address.hex),
                                ),
                              ),
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              Text("Available balance ${ethBalance}"),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Address();
                    },
                  ));
                },
                child: Text('send'),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    balaneTimer?.cancel();
  }
}
