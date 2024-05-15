import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:moneymanagementapp/ui/text/text.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  String? name;
  double? coin1price;
  Future<dynamic> getprice() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'crypto price tracker',
              style: Kbody,
            ),
          ),
          body: FutureBuilder(
              future: getprice(),
              builder: (ctx, snapshot) {
                // Checking if future is resolved
                if (snapshot.connectionState == ConnectionState.done) {
                  // If we got an error
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        '${snapshot.error} occurred',
                        style: TextStyle(fontSize: 18),
                      ),
                    );

                    // if we got our data
                  } else if (snapshot.hasData) {
                    // Extracting data from snapshot object
                    final data = snapshot.data;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data[index]['name'],
                                ),
                                Text(
                                  data[index]['current_price'].toString(),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
    );
  }
}
