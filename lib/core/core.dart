import 'dart:isolate';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart';
import 'package:moneymanagementapp/screens/expenseinput.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class Core {
  var balance = 0.obs;

  Web3Client web3client = Web3Client(
      "https://5d9f-2405-201-e02a-80c0-c08-9fb8-690f-954d.ngrok-free.app/",
      Client());
  var name = 'jana'.obs;
  var income = 0.obs;
  var expense = 0.obs;
  var transactions = [].obs;
  var transactionsOfMonth = [].obs;
  var activities = ['na'].obs;
  var password = "";
  Rx<Wallet?> wallet = Rx(null);
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'JAN';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'APR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AUG';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      default:
        return 'DEC';
    }
  }

  createWallet() async {
    final random = Random();

    Wallet wallet =
        Wallet.createNew(EthPrivateKey.createRandom(random), password, random);
    this.wallet.value = wallet;
    final walletJson = wallet.toJson();
    final _auth = FirebaseAuth.instance;
    final email = _auth.currentUser!.email;
    await _flutterSecureStorage.write(
        key: "WALLET${email!}", value: walletJson);
    print(wallet.privateKey.address.hex);
  }

  Wallet walletFromJsonIsolate(String walletJson) =>
      Wallet.fromJson(walletJson, password);

  Future<bool> checkWalletExist() async {
    final _auth = FirebaseAuth.instance;
    final email = _auth.currentUser!.email;

    final walletJson = await _flutterSecureStorage.read(key: "WALLET${email!}");
    if (walletJson == null) {
      wallet.value = null;
      return false;
    }
    wallet.value = await Isolate.run(() => walletFromJsonIsolate(walletJson));
    return true;
  }

  int getDaysCountByMonth(int month) {
    switch (month) {
      case 1:
        return 30;
      case 2:
        return 28;
      case 3:
        return 31;
      case 4:
        return 30;
      case 5:
        return 31;
      case 6:
        return 30;
      case 7:
        return 31;
      case 8:
        return 31;
      case 9:
        return 30;
      case 10:
        return 31;
      case 11:
        return 30;
      default:
        return 31;
    }
  }

  List<int> getLast3Month() {
    final currentMonth = DateTime.now().month;
    final lastMonth = DateTime.now()
        .subtract(Duration(days: getDaysCountByMonth(currentMonth)));
    final previousMonth = DateTime.now().subtract(Duration(
        days: (getDaysCountByMonth(currentMonth) +
            getDaysCountByMonth(currentMonth))));

    return [previousMonth.month, lastMonth.month, currentMonth];
  }

  void addTransaction(typeenum? type, int amount, String name, String des) {
    if (type == typeenum.income) {
      income.value = income.value + amount;
      balance.value = balance.value + amount;
    } else {
      expense.value = expense.value + amount;
      balance.value = balance.value - amount;
    }
    final timestamp = DateTime.now();
    transactions.add({
      'name': name,
      'amount': amount.obs,
      'des': des,
      'type': type == typeenum.expense ? 'expense' : 'income',
      'timestamp': timestamp,
    });
    getTransactionsByMon(DateTime.now().month);
  }

  getTransactionsByMon(int month) {
    transactionsOfMonth.value =
        transactions.where((tx) => tx['timestamp'].month == month).toList();
  }
}
