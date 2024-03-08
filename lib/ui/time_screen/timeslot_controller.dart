import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_airurban/components/image_picker/utilimagepicker.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/model/response/get_category_response/get_category_response.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class TimeSlotController extends GetxController {
  ApiWorker apiWorker = ApiWorker();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String profileImg = '';
  final picker = ImagePicker();
  File? image;
  int tabTextIndexSelected = 0;
  bool isCliked = false;
  List<String> listTextTabToggle = ['Time List','Create Time'];

  List<String> category = [];
  List<GetCategoryData> getCategoryDataList = [];
  String? selectedCategory;
  var selectedProduct = [];

  List<String> options = [
    '09:00 AM - 09:30 AM',
    '09:30 AM - 10:00 AM',
    '10:00 AM - 10:30 AM',
    '10:30 AM - 11:00 AM',
    '11:00 AM - 11:30 AM',
    '11:30 AM - 12:00 AM',
    '12:00 PM - 12:30 PM',
    '12:30 PM - 01:00 PM',
  '01:00 PM - 01:30 PM',
    '01:30 PM - 02:00 PM',
  '02:00 PM - 02:30 PM',
  '02:30 PM - 03:00 PM',
  ];
  List<String> tags = [];
  List<String> tagseslect = ['09:30 AM - 10:00 AM','12:00 PM - 12:30 PM','01:30 PM - 02:00 PM','02:30 PM - 03:00 PM'];
  String btnType = "0";

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

  getCategory() async {
    category.clear();
    getCategoryDataList.clear();
    category.add('Select Category');
    await apiWorker.getCategory().then((value) async {
      if (value.responseType == 'Success') {
        getCategoryDataList = value.responseObject ?? [];
        value.responseObject!.forEach((element) {
          category.add(element.name ?? '');
        });
        print('getCategoryDataList ${getCategoryDataList.length}');
        print('categoryList ${category.length}');
        updateScreen('timeslot');
      } else {
        Get.snackbar('Unsuccessful', '${value.responseMessage}',
            backgroundColor: greyColor.withOpacity(0.5),
            snackPosition: SnackPosition.BOTTOM,
            colorText: primaryTextColor);
      }
    });
  }

  Future bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (widgetBuilder) =>
            bottomSheetForSelectionFile(context, (File selectedFile) async {
              print("imagefile ${selectedFile.path}");
              if (selectedFile != null) {
                print("imagefile ${selectedFile.path}");
                image = selectedFile;
                profileImg = selectedFile.path;
                updateScreen('profile');
              }
            }));
  }

}
