import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';

class KPGeneralSize {
  static double kPIconSize({double? iconSize}) =>
      iconSize ?? AppDimensions.instance!.height * 0.03;

  static double kPCommonBorderRadius({double? borderRadius}) =>
      borderRadius ?? 8.0;

  static double kPCommonButtonBorderRadius({double? borderRadius}) =>
      borderRadius ?? 16.0;

  static double kP20BorderRadius({double? borderRadius}) =>
      borderRadius ?? 20.0;

  static FontWeight nkGeneralFontWeight({FontWeight? fontWeight}) =>
      fontWeight ?? FontWeight.w400;

  static FontWeight kPBoldFontWeight({FontWeight? fontWeight}) =>
      fontWeight ?? FontWeight.bold;

  static ScrollPhysics commonPysics({ScrollPhysics? physics}) =>
      Platform.isAndroid
          ? physics ?? const AlwaysScrollableScrollPhysics()
          : physics ?? const AlwaysScrollableScrollPhysics();
}
