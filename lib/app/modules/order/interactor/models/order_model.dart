// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:teste_delivery/app/core/types/type.dart';
import 'package:teste_delivery/app/modules/order/interactor/models/item_order_model.dart';

class OrderModel {
  final String orderId;
  final String orderIdStore;
  final String clientName;
  final String orderName;
  String status;
  final String value;
  final String deliveryDate;
  final String address;
  final List<ItemOrderModel> items;
  OrderModel({
    required this.orderId,
    required this.orderIdStore,
    required this.clientName,
    required this.orderName,
    required this.status,
    required this.value,
    required this.deliveryDate,
    required this.address,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'orderIdStore': orderIdStore,
      'clientName': clientName,
      'orderName': orderName,
      'status': status,
      'value': value,
      'deliveryDate': deliveryDate,
      'address': address,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      orderId: map['order_id'] as String,
      orderIdStore: map['order_id_store'] as String,
      clientName: map['client_name'] as String,
      orderName: map['order_name'] as String,
      status: map['status'] as String,
      value: map['value'] as String,
      deliveryDate: map['delivery_date'] as String,
      address: map['address'] as String,
      items: List<ItemOrderModel>.from(
        (map['items'] as List<Json>).map<ItemOrderModel>(
          (x) => ItemOrderModel.fromMap(x),
        ),
      ),
    );
  }

  factory OrderModel.empty() {
    return OrderModel(
      orderId: "",
      orderIdStore: "",
      clientName: "",
      orderName: "",
      status: "",
      value: "",
      deliveryDate: "",
      address: "",
      items: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
