import 'package:get/get.dart';
import 'package:moneymanagementapp/screens/expenseinput.dart';

class Core {
  var balance = 0.obs;

  var name = 'jana'.obs;
  var income = 0.obs;
  var expense = 0.obs;
  var transactions = [].obs;
  var transactionsOfMonth = [].obs;
  var activities = ['na'].obs;

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
