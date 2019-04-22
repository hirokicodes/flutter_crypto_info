import 'package:flutter/material.dart';
import 'package:flutter_crypto_info/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatefulWidget {
  final List currencies;
  MyApp(this.currencies);

  @override
  _MyAppState createState() => _MyAppState(currencies);
}

class _MyAppState extends State<MyApp> {
  final List _currencies;

  _MyAppState(this._currencies);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        home: HomePage(_currencies));
  }
}

Future<List> getCurrencies() async {
  String cryptoUrl = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
  http.Response response = await http.get(cryptoUrl);
  return jsonDecode(response.body);
}
