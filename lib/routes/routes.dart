import 'package:get/get.dart';
import 'package:vendor_airurban/general_binding/common_binding.dart';
import 'package:vendor_airurban/ui/allow_location/allow_location_screen.dart';
import 'package:vendor_airurban/ui/home_main/home_main.dart';
import 'package:vendor_airurban/ui/login_screen/login_screen.dart';
import 'package:vendor_airurban/ui/order_screen/order_screen.dart';
import 'package:vendor_airurban/ui/profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:vendor_airurban/ui/profile_screen/profile_screen.dart';
import 'package:vendor_airurban/ui/signup_screen/signup_screen.dart';
import 'package:vendor_airurban/ui/splash_screen/splash_screen.dart';
import 'package:vendor_airurban/ui/time_screen/edit_timeslot_screen.dart';
import 'package:vendor_airurban/ui/time_screen/timeslot_screen.dart';

class AppRoutes {
  static const String initialRoutes = "/";
  static const String splashScreen = "/splashScreen";
  static const String login = "/login";
  static const String signUp = "/signUp";
  static const String homeMain = "/homeMain";
  static const String profile = "/profile";
  static const String editprofile = "/editprofile";
  static const String time = "/time";
  static const String edittime = "/edittime";
  static const String allowLocationScreen = "/allowLocationScreen";
  static const String orderScreen = "/orderScreen";

  static List<GetPage<dynamic>> get generateRoutes => [
    GetPage(name: allowLocationScreen, page: () => AllowLocationScreen(), binding: CommonBinding()),
        GetPage(
            name: login, page: () => LoginScreen(), binding: CommonBinding()),
        GetPage(
            name: signUp, page: () => SignUpScreen(), binding: CommonBinding()),
        GetPage(
            name: homeMain, page: () => HomeMain(), binding: CommonBinding()),
        GetPage(name: profile, page: () => ProfileScreen(), binding: CommonBinding()),
        GetPage(name: editprofile, page: () => EditProfileScreen(), binding: CommonBinding()),
        GetPage(
            name: splashScreen,
            page: () => SplashScreen(),
            binding: CommonBinding()),
        GetPage(
            name: time, page: () => TimeSlotScreen(), binding: CommonBinding()),
        GetPage(
            name: edittime,
            page: () => EditTimeSlotScreen(),
            binding: CommonBinding()),
        GetPage(
            name: orderScreen,
            page: () => OrderScreen(),
            binding: CommonBinding()),
      ];
}
