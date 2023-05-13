import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu.freezed.dart';
part 'menu.g.dart';

@freezed
class Menu with _$Menu {
  const factory Menu(String code, String name, int price) = _Menu;
  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
}
