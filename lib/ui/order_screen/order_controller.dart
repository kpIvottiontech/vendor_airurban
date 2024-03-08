import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_airurban/components/image_picker/utilimagepicker.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/model/response/get_category_response/get_category_response.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class OrderController extends GetxController {
  ApiWorker apiWorker = ApiWorker();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String destinationType = '';
  String profileImg = '';
  final picker = ImagePicker();
  File? image;
  int tabTextIndexSelected = 0;
  bool isCliked = false;
  List<String> listTextTabToggle = ['New','Accepted','Rejected'];
  final formKey = GlobalKey<FormState>();
  final searchTC = TextEditingController();
  final descriptionTC = TextEditingController();
  String? selectedStatus;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  updateScreen(String value) {
    update([value]);
  }


}
