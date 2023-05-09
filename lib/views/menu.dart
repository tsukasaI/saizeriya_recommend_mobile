import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  static const routerName = "/menu";
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aaa'),
      ),
      body: const Center(
        child: Text("Hogehoge"),
      ),
    );
  }
}
