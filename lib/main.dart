import 'package:flutter/material.dart';

import 'on_boarding/on_borading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Test Simple App',

      home:OnBoarding(),
    );
  }
}

