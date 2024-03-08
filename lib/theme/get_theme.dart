import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/common_size/nk_general_size.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';

import 'color/colors.dart';
import 'font_style.dart';

class NkGetXTheme {
  static ThemeData get lightTheme => ThemeData(
      shadowColor: shadowColor,
      primaryColor: primaryColor,
      primaryColorLight: primaryColor,
      primaryColorDark: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: appBarTheme,
      textTheme: NkGetXFontStyle.primaryTextTheme,
      //primaryTextTheme: NkGetXFontStyle.newFontStyle,
      dataTableTheme: dataTableTheme,
      dividerColor: dividerColor,
      listTileTheme:
      ListTileThemeData(contentPadding: kPSymmetricPadding(vertical: 0)),
      expansionTileTheme: ExpansionTileThemeData(
          iconColor: primaryColor,
          collapsedBackgroundColor: backgroundColor,
          backgroundColor: Colors.transparent,
          textColor: primaryTextColor,
          collapsedTextColor: primaryTextColor,
          tilePadding: kPSymmetricPadding(vertical: 0),
          childrenPadding: EdgeInsets.zero),
      colorScheme: ColorScheme.light(
          primary: primaryColor,
          error: errorColor,
          onError: errorColor,
          background: backgroundColor,
          onBackground: backgroundColor,
          primaryContainer: primaryContainerColor,
          onSecondary: secondaryColor,
          secondaryContainer: secondaryColor,
          surface: backgroundColor,
          secondary: secondaryColor,
          brightness: Get.theme.brightness),
      iconTheme: IconThemeData(
          color: primaryTextColor, size: KPGeneralSize.kPIconSize()),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: secondaryTextColor,
        selectionColor: cursorColor,
        selectionHandleColor: primaryButtonColor,
      ),
      useMaterial3: true,
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
              iconColor: MaterialStatePropertyAll(secondaryIconColor))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedLabelStyle: NkGetXFontStyle.primaryTextTheme.labelMedium
              ?.copyWith(
              fontWeight: KPGeneralSize.nkGeneralFontWeight(),
              fontSize: 16.0,
              color: white),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: NkGetXFontStyle.primaryTextTheme.labelMedium
              ?.copyWith(
              fontWeight: KPGeneralSize.nkGeneralFontWeight(),
              fontSize: 16.0,
              color: primaryTextColor)),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: backgroundColor,
        surfaceTintColor: backgroundColor,
        modalBackgroundColor: backgroundColor,
      ),
      primaryIconTheme: IconThemeData(
          color: primaryTextColor, size: KPGeneralSize.kPIconSize()),
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
          buttonColor: primaryTextColor,
          textTheme: ButtonTextTheme.normal,
          padding: kPRegularPadding(),
          height: Get.height * 0.06,
          disabledColor: primaryButtonColor,
          focusColor: primaryButtonColor,
          layoutBehavior: ButtonBarLayoutBehavior.padded,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(KPGeneralSize.kPCommonBorderRadius()),
          )),
    popupMenuTheme: PopupMenuThemeData(
      color: backgroundColor,
      surfaceTintColor: backgroundColor,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: primaryLight,
      surfaceTintColor: Colors.transparent,
      headerForegroundColor: primaryTextColor.withOpacity(0.8),
      elevation: 5,
      dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return yellowColor;
        }
        return primaryLight.withOpacity(0.4);
      }),
    ),
    dialogBackgroundColor: backgroundColor,
    dialogTheme: DialogTheme(
      surfaceTintColor: backgroundColor,
      backgroundColor: backgroundColor,
    )
  );

  static AppBarTheme get appBarTheme => AppBarTheme(
      color: backgroundColor,
      foregroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      shadowColor: shadowColor,
      centerTitle: true,
      titleTextStyle: TextStyle());

  static DataTableThemeData get dataTableTheme => DataTableThemeData(
    columnSpacing: AppDimensions.instance!.width * .02,
    //dataRowMaxHeight: height * 0.1,
    headingTextStyle: Get.textTheme.displayLarge!.copyWith(
      inherit: false,
      fontWeight: KPGeneralSize.kPBoldFontWeight(),
      fontSize: NkFontSize.largeFont(),
      color: primaryTextColor,
    ),
  );

  static void get systemChromeStyle {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
