// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'enroll/enroll.dart';
import 'membership/memberships.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memberships'),
        actions: [
          IconButton(
            onPressed: toggleWidget,
            icon: Icon(toggle ? Icons.toggle_on : Icons.toggle_off),
          ),
        ],
      ),
      body: toggle ? const EnrollWidget() : const MembershipsWidget(),
    );
  }

  void toggleWidget() {
    setState(() {
      toggle = !toggle;
    });
  }
}
