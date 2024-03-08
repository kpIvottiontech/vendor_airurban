import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/profile_screen/widget/my_popupmenu/my_popupmenu.dart';
import '../../../components/common_size/nk_font_size.dart';

class KpAppBar extends PreferredSize {
  final Widget? appBarChild;
  final Size? appBarSize;
  final String title;
  final Color? backgroundColor;
  final void Function()? onBackTap;
  final void Function()? moreOptionTap;
  final bool? isBack;
  final bool? isMoreOption;
  final double? width;
  final double? fontSize;

  KpAppBar(
      {super.key,
      this.appBarChild,
      this.appBarSize,
      required this.title,
      this.backgroundColor,
        this.width,
      this.isBack = false,
      this.isMoreOption = false,
      this.onBackTap,
      this.moreOptionTap,
        this.fontSize
      })
      : super(
            child: Container(),
            preferredSize: appBarSize ??
                Size.fromHeight(AppDimensions.instance!.height / 14));

  @override
  Widget get child => PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: greyColor.withOpacity(0.3),
                blurRadius: 5.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isBack == true?
            Row(
              children: [
                InkResponse(
                  onTap: onBackTap ??
                      () {
                        Get.back();
                      },
                  child: backIcon,
                ),
                kPMediumSizeBox(width: AppDimensions.instance!.width / 18),
              ],
            ): SizedBox(),

            SizedBox(
              width:width?? AppDimensions.instance!.width/1.3,
              child:  appBarChild ?? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyRegularText(
                    label: title,
                    fontWeight: FontWeight.w600,
                    align: TextAlign.left,
                    fontSize:fontSize?? NkFontSize.regularFont(regularFont: 17),
                    color: primaryColor,
                  ),
                  isMoreOption == true?
                  Builder(
                    builder: (context) => MyPopupMenu(),
                  ): SizedBox(),
                  /*InkResponse(
                    onTap: (){
                      MyPopupMenu();
                    },
                    child: moreOption,
                  ): SizedBox(),*/

                ],
              ),
            )
          ],
        ),
      ));

  Widget get backIcon => MyCommnonContainer(
      height: AppDimensions.instance!.height * 0.035,
      width: AppDimensions.instance!.height * 0.035,
      child: Icon(Icons.arrow_back_ios, color: primaryColor,size: 20,));

  Widget get moreOption => MyCommnonContainer(
      height: AppDimensions.instance!.height * 0.035,
      width: AppDimensions.instance!.height * 0.035,
      child: Icon(Icons.more_vert_outlined, color: primaryColor,size: 20,));
}
