import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/my_theme_button.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class DialogUtils {
  static BuildContext? context;

  static showLoader(BuildContext ctx) {
    context = ctx;
    showDialog(
      //barrierColor: Colors.white,
      context: ctx,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: primaryButtonColor,
          ),
        );
      },
    );
  }

  static void hideLoader() {
    if (context != null) {
      Get.back();
      context = null;
    }
  }

  static void acceptOrderDialog(BuildContext ctx,
      {String? message,
        void Function()? onPressed}) {
    print('test1');
    context = ctx;
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        print('test2');
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(
              horizontal: AppDimensions.instance!.width / 40),
          contentPadding: EdgeInsets.symmetric(
              horizontal: AppDimensions.instance!.width / 40,
              vertical: AppDimensions.instance!.height / 30),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.close,
                      size: AppDimensions.instance!.height / 30,
                      color: primaryTextColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppDimensions.instance!.height / 40),
              Center(
                child: Column(
                  children: [
                    MyRegularText(
                      label: message ?? 'Enter message',
                      fontSize: 18,
                      maxlines: 100,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimensions.instance!.height / 40),
              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  MyThemeButton(
                    onPressed: () {
                      Get.back();
                    },
                    buttonText: 'No',
                    color: greyColor2,
                    fontColor: white,
                    fontSize: 14,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    width: AppDimensions.instance!.width/3.5,
                    height: AppDimensions.instance!.height / 20,
                    padding: EdgeInsets.zero,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: MyThemeButton(
                      onPressed: () {

                      },
                      buttonText: 'Yes',
                      color: yellowColor,
                      fontColor: primaryTextColor,
                      fontSize: 14,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      width: AppDimensions.instance!.width/3.5,
                      height: AppDimensions.instance!.height / 20,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
