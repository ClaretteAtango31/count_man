import 'package:flutter/material.dart';
import 'package:count_man_app/widgets/login.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count Man App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.white,
        hintColor: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}