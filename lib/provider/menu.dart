import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '../models/menu.dart';

final menuProvider = FutureProvider<List<Menu>>((ref) async {
  final doc = await rootBundle.loadString('assets/json/menu.json');
  List<dynamic> jsonData = json.decode(doc);
  List<Menu> loadedMenus = jsonData.map((data) => Menu.fromJson(data)).toList();
  return loadedMenus;
});
