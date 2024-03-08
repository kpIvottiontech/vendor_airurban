import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_airurban/components/image_picker/utilimagepicker.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';

class ProfileController extends GetxController {
  ApiWorker apiWorker = ApiWorker();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String profileImg = '';
  final picker = ImagePicker();
  File? image;

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
