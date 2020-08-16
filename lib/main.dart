import 'package:OptixToolkit/widgets/home.dart';
import 'package:flutter/material.dart';
import 'widgets/form.dart';
//import 'widgets/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: FormPage(title: "Hello", isLogin: true),
      ),
    );
  }
}
