import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/menu.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/menu.dart' as menu_model;

class Recommend extends StatefulWidget {
  static const routerName = "/";
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  List<menu_model.Menu> menus = [];

  @override
  void initState() {
    getJson();

    super.initState();
  }

  void getJson() {
    rootBundle.loadString('assets/json/menu.json').then((doc) {
      List<dynamic> jsonData = json.decode(doc);

      List<menu_model.Menu> loadedMenus =
          jsonData.map((data) => menu_model.Menu.fromJson(data)).toList();
      setState(() {
        menus = loadedMenus;
      });
    });
  }

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
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    context.push(Menu.routerName);
                  },
                  child: Text('menu')),
              Flexible(
                child: ListView.builder(
                  itemCount: menus.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Row(
                      children: [
                        Flexible(
                            child: Container(child: Text(menus[index].name))),
                        Text('${menus[index].price.toString()}円'),
                      ],
                    ),
                    subtitle: Text(menus[index].code),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
