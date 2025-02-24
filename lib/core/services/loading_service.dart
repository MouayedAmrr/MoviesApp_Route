import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../theme/color_palette.dart';

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..textColor = Colors.white
    ..indicatorColor = ColorPalette.primaryColor
    ..userInteractions = false
    ..dismissOnTap = false;
}
