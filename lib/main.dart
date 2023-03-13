import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quotes_app/Screen/View/AuthorShowPage.dart';
import 'package:quotes_app/Screen/View/QuotePage.dart';
import 'package:quotes_app/Screen/View/ShowPage.dart';
import 'package:quotes_app/Screen/View/customPage.dart';

import 'Screen/View/AddPage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (p0) => QuotesPage(),
        'Q': (p0) => ShowQuotesPage(),
        'A': (p0) => AuthorShowPage(),
        'ADD': (p0) => AddPage(),
        'Custom': (p0) => UserQuotesPage(),
      },
    ),
  );
}
