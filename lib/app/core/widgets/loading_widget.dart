import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:teste_delivery/app/core/themes/extensions/color_theme_extension.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      color: context.appColors.white,
      size: 26,
    );
  }
}
