import 'package:get/get.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/ui/allow_location/allow_location_controller.dart';
import 'package:vendor_airurban/ui/home_main/home_main_controller.dart';
import 'package:vendor_airurban/ui/login_screen/login_controller.dart';
import 'package:vendor_airurban/ui/order_screen/order_controller.dart';
import 'package:vendor_airurban/ui/profile_screen/edit_profile_screen/edit_profile_controller.dart';
import 'package:vendor_airurban/ui/profile_screen/profile_controller.dart';
import 'package:vendor_airurban/ui/signup_screen/signup_controller.dart';
import 'package:vendor_airurban/ui/time_screen/timeslot_controller.dart';

/// Its A Example to Use This Type Of Binding
class CommonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiWorker());
    Get.lazyPut(() => AllowLocationController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => HomeMainController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EditProfileController());
    Get.lazyPut(() => TimeSlotController());
    Get.lazyPut(() => OrderController());
  }
}
