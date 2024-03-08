import 'package:flutter/material.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';

import '../../theme/font_style.dart';
import 'common_size/nk_general_size.dart';

class MyRegularText extends StatelessWidget {
  final String label;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextAlign? align;
  final int? maxlines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? stepGranularity;
  final TextStyle? style;
  final bool showEmptyError;
  final bool isSecondaryText;
  final TextDecorationStyle? textDecorationStyle;

  const MyRegularText({
    Key? key,
    required this.label,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.align = TextAlign.center,
    this.maxlines,
    this.decoration = TextDecoration.none,
    this.overflow = TextOverflow.ellipsis,
    this.letterSpacing,
    this.stepGranularity,
    this.style,
    this.textDecorationStyle,
    this.showEmptyError = false,
    this.isSecondaryText=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return label.isNotEmpty || !showEmptyError
        ? Text(label.isNotEmpty ? label : '',
            textAlign: align,
            maxLines: maxlines ?? 2,
            softWrap: true,
            //minFontSize: 12,
            overflow: overflow,
            style: isSecondaryText==false?style ??
                theme.textTheme.labelMedium?.copyWith(
                  color: color,
                  inherit: true,
                  decorationStyle: textDecorationStyle,
                  fontSize: fontSize ?? NkFontSize.regularFont(),
                  letterSpacing: letterSpacing,
                  fontWeight: fontWeight ?? KPGeneralSize.nkGeneralFontWeight(),
                  fontStyle: FontStyle.normal,
                  decoration: decoration,
                  //decorationColor: theme.de,
                  decorationThickness: 1,
                ):NkGetXFontStyle.primaryTextTheme.labelMedium?.
            copyWith(
              color: color,
              inherit: true,
              decorationStyle: textDecorationStyle,
              fontSize: fontSize ?? NkFontSize.regularFont(),
              letterSpacing: letterSpacing,
              fontWeight: fontWeight ?? KPGeneralSize.nkGeneralFontWeight(),
              fontStyle: FontStyle.normal,
              decoration: decoration,
              //decorationColor: theme.de,
              decorationThickness: 1,
            )
    )
        : ErrorWidget.withDetails(
            message: "PLEASE DO NOT EMPTY LIABLE",
            error: FlutterError("PLEASE DO NOT EMPTY LIABLE"),
          );
  }
}

