import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:teste_delivery/app/app_module.dart';
import 'package:teste_delivery/app/app_widget.dart';

void main() async {
  usePathUrlStrategy();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
