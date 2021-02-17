import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:sample_task/theme/theme_color.dart';
import 'package:sample_task/theme/theme_text_style.dart';


class AppTheme {

  static const Color primaryColor = Color(0xfff6feff);
  static const Color appWhite = const Color(0xFFFfffff);
  static const Color accentColor = const Color(0xFF2699FB);


  static AppColor get colors {
    return new AppColor.getColor();
  }

  static AppTextStyle get textStyle {
    return new AppTextStyle.getStyle();
  }
}
