import 'package:flutter/material.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.screenSize.width,
        height: context.screenSize.height,
        child: const Row(
          children: [],
        ),
      ),
    );
  }
}
