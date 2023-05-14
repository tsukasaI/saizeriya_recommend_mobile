import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/menu.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/menu.dart' as menu_model;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/menu.dart';

class Recommend extends StatefulWidget {
  static const routerName = "/";
  const Recommend({super.key});

  @override
  State<Recommend> createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  List<menu_model.Menu> recommendMenus = [];

  final _priceController = TextEditingController();

  void handleRecommend(List<menu_model.Menu> menus) {
    int? price = int.tryParse(_priceController.text);
    if (price != null) {}
    final List<menu_model.Menu> result = [];
    final int minPrice = menus
        .reduce(
            (value, element) => value.price <= element.price ? value : element)
        .price;
    while (price! >= minPrice) {
      final withinBadgetMenus =
          menus.where((element) => element.price <= price!).toList();
      withinBadgetMenus.shuffle();
      final randomMenu = withinBadgetMenus.first;
      result.add(randomMenu);
      price = price - randomMenu.price;
    }
    setState(() {
      recommendMenus = result;
    });
  }

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
                      TextButton(
                          onPressed: () {
                            context.push(Menu.routerName);
                          },
                          child: Text('menu')),
                      TextField(
                        controller: _priceController,
                        keyboardType: TextInputType.number,
                      ),
                      TextButton(
                          onPressed: () {
                            handleRecommend(menus);
                          },
                          child: Text('予算を決定')),
                      Flexible(
                        child: ListView.builder(
                          itemCount: recommendMenus.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Row(
                              children: [
                                Flexible(
                                    child: Container(
                                        child:
                                            Text(recommendMenus[index].name))),
                                Text(
                                    '${recommendMenus[index].price.toString()}円'),
                              ],
                            ),
                            subtitle: Text(recommendMenus[index].code),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            error: (err, st) => const Text("Error"),
            loading: () => const Text("Loading"),
          ));
}
