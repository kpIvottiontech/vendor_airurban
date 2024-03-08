import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/my_theme_button.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/allow_location/allow_location_controller.dart';


class AllowLocationScreen extends StatefulWidget {
  const AllowLocationScreen({super.key});

  @override
  State<AllowLocationScreen> createState() => _AllowLocationScreenState();
}

class _AllowLocationScreenState extends State<AllowLocationScreen> {
  AllowLocationController allowLocationController = Get.find();

  @override
  void initState() {
    allowLocationController.getIsLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: mainWidget(context)),
    );
  }

  Widget mainWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            size: AppDimensions.instance!.width / 2.5,
            color: primaryColor,
          ),
          Column(children: [
            MyRegularText(
              label: "Allow your location",
              fontSize: NkFontSize.largeFont(),
              color: primaryColor,
            ),
            kPMediumSizeBox(),
            const MyRegularText(
              label:
                  "We will need your location to give\nyou better experience",
            ),
            kPMediumSizeBox(),
            FittedBox(
              child: MyThemeButton(
                onPressed: () {
                 // allowLocationController.getLocationPermission(context);
                  allowLocationController.getCurrentPosition();
                },
                buttonText: 'Sure I’d like that',
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
