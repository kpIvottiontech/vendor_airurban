
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/color/colors.dart';
import 'my_regular_text.dart';

@immutable
class MyDropdownField extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final String hint;
  final List<String> dropdownItems;
  final Widget? icon;
  final Widget? underLineIcon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final String? changedValue;

  final FontWeight? fontWeight;
  final double? fontSize;
  final BorderRadius? borderRadius;
  final Color? fontColor;
  final AlignmentGeometry? alignment;
  final Color? dropdownColor;
  final bool? isEnable;

  const MyDropdownField({
    required this.hint,
    required this.dropdownItems,
    this.fontWeight,
    this.fontSize,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    Key? key,
    this.borderRadius,
    this.fontColor,
    this.alignment,
    this.dropdownColor,
    this.onChanged,
    this.changedValue,
    this.icon,
    this.underLineIcon,
    this.isEnable = true,
  }) : super(key: key);

  @override
  State<MyDropdownField> createState() => _MyDropdownFieldState();
}

class _MyDropdownFieldState extends State<MyDropdownField> {

  @override
  Widget build(BuildContext context) {
   // print(' widget.changedValue>>${ widget.changedValue} >>${widget.dropdownItems[0]}');
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
       // borderRadius: widget.borderRadius,
        alignment: widget.alignment ?? AlignmentDirectional.center,
        value: widget.changedValue ?? widget.dropdownItems[0],
        style: Get.theme.textTheme.displayMedium,
        //validator: validator,
        //dropdownColor: widget.dropdownColor ?? secondaryColor,
        underline: widget.underLineIcon,
        isExpanded: true,
        hint: MyRegularText(label: widget.hint,maxlines: 1,),
        items: widget.dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item ?? widget.hint,
                  child: MyRegularText(
                    label: item ?? widget.hint,
                    fontSize: widget.fontSize,
                    fontWeight: widget.fontWeight,
                    maxlines: 2,
                    color: widget.fontColor,
                  ),
                ))
            .toList(),
        onChanged: widget.onChanged!,
        iconStyleData: IconStyleData(
          icon: widget.icon ??
              const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
              ),
          iconSize: widget.iconSize ?? 17,
          iconEnabledColor: widget.iconEnabledColor,
          iconDisabledColor: widget.iconDisabledColor,
        ),
        buttonStyleData: ButtonStyleData(
          height: widget.itemHeight ?? 53,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
