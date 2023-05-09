import 'package:flutter/material.dart';

class Recommend extends StatelessWidget {
  static const routerName = "/";
  const Recommend({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recommend'),
        ),
        body: Center(
          child: Text('Recommend'),
        ),
      ),
    );
  }
}
