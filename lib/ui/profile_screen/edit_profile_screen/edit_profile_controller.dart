import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vendor_airurban/components/image_picker/utilimagepicker.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/model/request/signup_request/signup_request.dart';
import 'package:vendor_airurban/model/response/get_category_response/get_category_response.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/utils/dialog_utils.dart';

class EditProfileController extends GetxController {
  ApiWorker apiWorker = ApiWorker();
  final businessNameTC = TextEditingController();
  final nameTC = TextEditingController();
  final mobileTC = TextEditingController();
  final emailTC = TextEditingController();
  final pswrdTC = TextEditingController();
  final bankNameTC = TextEditingController();
  final accountNameTC = TextEditingController();
  final accountNumberTC = TextEditingController();
  final bsbTC = TextEditingController();
  final drivingLicenseTC = TextEditingController();
  final passportNumberTC = TextEditingController();
  final locationTC = TextEditingController();
  final aboutUsTC = TextEditingController();
  bool isVisible1 = false;
  final formKey = GlobalKey<FormState>();
  String initialCountry = 'AU';
  PhoneNumber number = PhoneNumber(isoCode: 'AU');
  List<String> category = [];
  List<GetCategoryData> getCategoryDataList = [];
  String? selectedCategory;
  RxBool phnValidator = true.obs;

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
                print("imagefile ${selectedFile.path}");
                updateScreen('editProfile');
               // await upload(selectedFile.path);
              }
            }));
  }

  signUp({BuildContext? context}) async {
    print(
        '>>>print ${getCategoryDataList[(category.indexOf(selectedCategory!) - 1)].categoryid}');
    DialogUtils.showLoader(context!);
    SignupRequest signupRequest = SignupRequest(
        name: nameTC.text.trim(),
        bankName: bankNameTC.text.trim(),
        accountName: accountNameTC.text.trim(),
        accountNumber: accountNumberTC.text.trim(),
        businessName: businessNameTC.text.trim(),
        phone: mobileTC.text.trim(),
        drivingLicense: drivingLicenseTC.text.trim(),
        passportNumber: passportNumberTC.text.trim(),
        emailAddress: emailTC.text.trim(),
        password: pswrdTC.text.trim(),
        bsb: bsbTC.text.trim(),
        categoryId:
            getCategoryDataList[(category.indexOf(selectedCategory!) - 1)]
                .categoryid);
    print('>>>print ${signupRequest.toJson()}');
    await apiWorker.signUp(signupRequest).then((value) async {
      if (value.responseType == 'Success') {
        DialogUtils.hideLoader();
        Get.snackbar('Successful', '${value.responseMessage}',
            backgroundColor: textFieldBorderColor,
            snackPosition: SnackPosition.BOTTOM,
            colorText: primaryTextColor);
        clearAll();
      } else {
        DialogUtils.hideLoader();
        Get.snackbar('Unsuccessful', '${value.responseMessage}',
            backgroundColor: textFieldBorderColor,
            snackPosition: SnackPosition.BOTTOM,
            colorText: primaryTextColor);
      }
    });
  }

  clearAll() async {
    businessNameTC.clear();
    nameTC.clear();
    emailTC.clear();
    pswrdTC.clear();
    mobileTC.clear();
    bankNameTC.clear();
    accountNameTC.clear();
    accountNumberTC.clear();
    bsbTC.clear();
    drivingLicenseTC.clear();
    passportNumberTC.clear();
    Get.delete<EditProfileController>();
    Get.offAndToNamed(AppRoutes.login);
  }

  updateScreen(String value) {
    update([value]);
  }
}
