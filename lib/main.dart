import 'package:flutter/material.dart';
import 'package:task/view/cart.dart';
import 'package:task/view/check_out.dart';

import 'view/description_of_item.dart';
import 'view/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: homeScreen(),
    );
  }
}
