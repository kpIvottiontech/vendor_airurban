import 'package:flutter/material.dart';

import '../theme/color/colors.dart';

class DecorationUtils {
  BuildContext context;

  DecorationUtils(this.context);

  InputDecoration getUnderlineInputDecoration({
    String? labelText = "",
    bool isRequire = false,
    bool isEnable = true,
    final Color? enableColor,
    final Color? disabledColor,
    bool? alignLabelWithHint,
    final Color? focusedColor,
    final Color? labelTextColor,
    final FloatingLabelBehavior? floatingLabelBehavior,
    icon,
    final Widget? prefixIcon,
    final Widget? suffixIcon,
    final BorderRadius? borderRadius,
    final Color? fillColor,
    final Color? hintColor,
    final InputBorder? border,
    final EdgeInsetsGeometry? contentPadding,
  }) {
    return InputDecoration(
      fillColor: isRequire ? fillColor ?? Colors.white : Colors.white,
      filled: (isEnable) ? true : true,
      alignLabelWithHint: alignLabelWithHint,
      suffixIcon: suffixIcon,
      icon: icon,
      border: InputBorder.none,
      prefixIcon: prefixIcon,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      labelText: labelText,
      counterText: "",
      labelStyle: TextStyle(
        color: labelTextColor ?? greyColor,
        fontSize: 14,
      ),
      hintStyle: TextStyle(
        color: hintColor ?? greyColor,
        fontSize: 14,
      ),
      errorStyle: TextStyle( color: yellowColor,
        fontSize: 12, ),
      floatingLabelBehavior:
          floatingLabelBehavior ?? FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: enableColor ?? white, width: 0.8),
        borderRadius: borderRadius ?? BorderRadius.circular(3.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: disabledColor ?? white, width: 0.8),
        borderRadius: borderRadius ?? BorderRadius.circular(3.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: focusedColor ?? white, width: 0.8),
        borderRadius: borderRadius ?? BorderRadius.circular(3.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: yellowColor, width: 0.8),
        borderRadius: borderRadius ?? BorderRadius.circular(3.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: yellowColor, width: 0.8),
        borderRadius: borderRadius ?? BorderRadius.circular(3.0),
      ),
    );
  }
}
