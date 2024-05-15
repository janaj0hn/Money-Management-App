import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:moneymanagementapp/core/core.dart';
import 'package:moneymanagementapp/screens/expenseinput.dart';
import 'package:moneymanagementapp/screens/total.dart';
import 'package:moneymanagementapp/ui/text/text.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key, this.data1});
  final String? data1;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final core = Get.find<Core>();
  var currentDatetime = DateTime.now();
  final _auth = FirebaseAuth.instance;

  late User loggedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    core.getTransactionsByMon(DateTime.now().month);
  }

  void getUser() async {
    final newuser = await _auth.currentUser;
    if (newuser != null) {
      loggedInUser = newuser;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Obx(
              () => Text(
                'welcome ' + core.name.value,
                style: Kbody,
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TotalAmount();
                  }));
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            label: Text('add transaction'),
            icon: Icon(
              Icons.currency_rupee,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ExpenseINput();
                },
              ));
            }),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ListView(children: [
            Container(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: core.getLast3Month().length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.black),
                  child: TextButton(
                      onPressed: () {
                        core.getTransactionsByMon(core.getLast3Month()[index]);
                      },
                      child: Text(
                        core.getMonthName(core.getLast3Month()[index]),
                        style: Kbody,
                      )),
                ),
              ),
            ),
            Column(children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'total'.toUpperCase(),
                            style: Kbody,
                          ),
                          Obx(() => Text(
                                core.balance.value.toString(),
                                style: KHeroB,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Income',
                                style: Kbody,
                              ),
                              Icon(
                                Icons.arrow_upward_rounded,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                'Expense',
                                style: Kbody,
                              ),
                              Icon(
                                Icons.arrow_downward_rounded,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Obx(() => Text(
                                      core.income.value.toString(),
                                      style: Kbody,
                                    )),
                                Obx(() => Text(
                                      core.expense.value.toString(),
                                      style: Kbody,
                                    ))
                              ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transactions',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      ' Viewchart',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: core.transactionsOfMonth.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.purple[900]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      core.transactions[index]['name']
                                          .toString(),
                                      style: Kbody,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            core.transactions[index]['type'] ==
                                                    'expense'
                                                ? '-'
                                                : '+',
                                            style: Kbody.copyWith(
                                                color: core.transactions[index]
                                                            ['type'] ==
                                                        'expense'
                                                    ? Colors.red
                                                    : Colors.greenAccent)),
                                        Text(
                                            core.transactions[index]['amount']
                                                .toString(),
                                            style: Kbody.copyWith(
                                                color: core.transactions[index]
                                                            ['type'] ==
                                                        'expense'
                                                    ? Colors.red
                                                    : Colors.greenAccent)),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        core.transactions[index]['des']
                                            .toString(),
                                        style: Kbody),
                                    Text(
                                        core.transactions[index]['timestamp']
                                            .toString(),
                                        style: Kbody),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
            ]),
          ]),
        ),
      ),
    );
  }
}
