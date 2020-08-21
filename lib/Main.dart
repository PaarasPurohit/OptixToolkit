import 'services/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:OptixToolkit/screens/Form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optix Toolkit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: NavigationService.navigatorKey,
      home: Scaffold(
        body: FormPage(isLogin: true),
      ),
    );
  }
}
