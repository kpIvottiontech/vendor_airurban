import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_form_field.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/my_theme_button.dart';
import 'package:vendor_airurban/components/mydropdownfield.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/order_screen/order_controller.dart';

class OrderStatusBottomsheet extends StatefulWidget {
  const OrderStatusBottomsheet({super.key});

  @override
  State<OrderStatusBottomsheet> createState() => _OrderStatusBottomsheetState();
}

class _OrderStatusBottomsheetState extends State<OrderStatusBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        id: 'order',
        init: OrderController(),
        builder: (order) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppDimensions.instance!.height / 90,
                  horizontal: AppDimensions.instance!.width / 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: MyRegularText(
                      fontSize: NkFontSize.regularFont(regularFont: 16),
                      label: 'Enter comment and update status',
                      fontWeight: FontWeight.w500,
                      align: TextAlign.center,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.instance!.height / 30,
                  ),
                  MyRegularText(
                    fontSize: NkFontSize.regularFont(regularFont: 16),
                    label: 'Status',
                    fontWeight: FontWeight.w500,
                    align: TextAlign.start,
                  ),
                  SizedBox(
                    height: AppDimensions.instance!.height / 90,
                  ),
                  Container(
                    height: AppDimensions.instance!.height / 15,
                    width: AppDimensions.instance!.width,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(width: 1, color: greyColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0.0,right: 10.0),
                      child: MyDropdownField(
                        hint: 'Select Status',
                        iconSize: 24,
                        // dropdownItems: signUp.category.map((e) => e.toString()).toList(),
                        dropdownItems: const [
                          "Select Status",
                          "On the way",
                          "Started",
                          "Completed"
                        ],
                        changedValue: order.selectedStatus ?? "Select Status",
                        //signUp.selectedCategory ?? signUp.category[0].toString(),
                        onChanged: (value) {
                          order.selectedStatus = value as String;
                          order.updateScreen('order');
                        },
                        fontSize: NkFontSize.regularFont(regularFont: 14),
                        fontColor: primaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimensions.instance!.height / 30,
                  ),
                  MyRegularText(
                    fontSize: NkFontSize.regularFont(regularFont: 16),
                    label: 'Description',
                    fontWeight: FontWeight.w500,
                    align: TextAlign.start,
                  ),
                  SizedBox(
                    height: AppDimensions.instance!.height / 90,
                  ),
                  Container(
                   // height: AppDimensions.instance!.height / 15,
                    width: AppDimensions.instance!.width,
                    decoration: BoxDecoration(
                      color: white,
                      border: Border.all(width: 1, color: greyColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: MyFormField(
                      labelText: 'Description',
                      controller: order.descriptionTC,
                      alignLabelWithHint: true,
                      borderRadius: BorderRadius.circular(10),
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.top,
                      maxLines: 3,
                      fontSize: 14.5,
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      textInputType: TextInputType.name,
                      validator: (name) {
                        RegExp regex = RegExp(r'^[A-Za-z]{2}\d{7}$');
                        if (name == null || name.isEmpty) {
                          return 'Please enter location';
                        }/*else if (!regex.hasMatch(name)) {
                                  return 'Please enter a valid passport number';
                                }*/else{
                          return null;
                        }
                      },
                    ),
                  ),
                  kPMediumSizeBox(),
                  Align(
                    alignment: Alignment.center,
                    child: MyThemeButton(
                      onPressed: () {
                        Get.back();
                      },
                      buttonText: 'Close',
                      color: primaryColor,
                      fontColor: white,
                      fontSize: 13,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: AppDimensions.instance!.height / 19,
                      width: AppDimensions.instance!.width / 2.8,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
