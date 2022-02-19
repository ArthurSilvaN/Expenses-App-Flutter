import 'package:flutter/material.dart';

import 'features/home/home.dart';
import 'theme/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'Expenses App',
      home: const HomePage(),
    );
  }
}
