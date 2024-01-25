import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_delivery/app/core/themes/theme_data.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      theme: themeData,
      debugShowCheckedModeBanner: false,
    );
  }
}
