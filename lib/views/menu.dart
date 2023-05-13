import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/menu.dart';

class Menu extends StatelessWidget {
  static const routerName = "/menu";

  const Menu({super.key});

  @override
  Widget build(BuildContext context) => Consumer(
        builder: (context, ref, child) => ref.watch(menuProvider).when(
              data: (menus) => MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                  ),
                  home: Scaffold(
                      appBar: AppBar(
                        title: Text('Recommend'),
                      ),
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: ListView.builder(
                              itemCount: menus.length,
                              itemBuilder: (context, index) => ListTile(
                                title: Row(
                                  children: [
                                    Flexible(
                                        child: Container(
                                            child: Text(menus[index].name))),
                                    Text('${menus[index].price.toString()}円'),
                                  ],
                                ),
                                subtitle: Text(menus[index].code),
                              ),
                            ),
                          )
                        ],
                      ))),
              error: (err, st) => const Text("Error"),
              loading: () => const Text("Loading"),
            ),
      );
}
