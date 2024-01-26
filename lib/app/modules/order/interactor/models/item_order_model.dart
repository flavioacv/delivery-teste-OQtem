// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemOrderModel {
  final String name;
  final String number;

  ItemOrderModel(this.name, this.number);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'number': number,
    };
  }

  factory ItemOrderModel.fromMap(Map<String, dynamic> map) {
    return ItemOrderModel(
      map['name'] as String,
      map['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemOrderModel.fromJson(String source) => ItemOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
