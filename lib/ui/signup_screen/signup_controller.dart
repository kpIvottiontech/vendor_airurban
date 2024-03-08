import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/model/request/signup_request/signup_request.dart';
import 'package:vendor_airurban/model/response/get_category_response/get_category_response.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/utils/dialog_utils.dart';

class SignUpController extends GetxController {
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
  bool isVisible1 = false;
  final formKey = GlobalKey<FormState>();
  String initialCountry = 'AU';
  PhoneNumber number = PhoneNumber(isoCode: 'AU');
  List<String> category = [];
  List<GetCategoryData> getCategoryDataList = [];
  String? selectedCategory;
  RxBool phnValidator = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
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
        updateScreen('signUp');
      } else {
        Get.snackbar('Unsuccessful', '${value.responseMessage}',
            backgroundColor: greyColor.withOpacity(0.5),
            snackPosition: SnackPosition.BOTTOM,
            colorText: primaryTextColor);
      }
    });
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
    Get.delete<SignUpController>();
    Get.offAndToNamed(AppRoutes.login);
  }

  updateScreen(String value) {
    update([value]);
  }
}
