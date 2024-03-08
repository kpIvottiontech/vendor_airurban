import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/ui/order_screen/order_screen.dart';
import 'package:vendor_airurban/ui/profile_screen/profile_screen.dart';
import 'package:vendor_airurban/ui/time_screen/timeslot_screen.dart';

class HomeMainController extends GetxController {
  ApiWorker apiWorker = ApiWorker();
  RxInt selectedIndex = 0.obs;
  int index = 0;

  @override
  void onInit() {
    super.onInit();
  }

  final List<Widget> screenWidgets = [
    Placeholder(),
    OrderScreen(),
    TimeSlotScreen(),
    ProfileScreen(),
  ];

  getArguments() {
    print('check ${Get.arguments}');
    selectedIndex.value = Get.arguments ?? 0;
  }

  List<Map<String, dynamic>> get tabData => [
        {
          'icon': selectedIndex.value == 0?Icons.home:Icons.home_outlined,
          'title': 'Home',
        },
        {
          'icon': selectedIndex.value == 1?Icons.fact_check_rounded:Icons.fact_check_outlined,
          'title': 'Order',
        },
        {
          'icon': selectedIndex.value == 2?Icons.more_time:Icons.more_time_outlined,
          'title': 'Time',
        },
        {
          'icon':selectedIndex.value == 3?Icons.person:Icons.person_outline_outlined,
          'title': 'Profile',
        },
      ];

  updateScreen(String value) {
    update([value]);
  }
}
