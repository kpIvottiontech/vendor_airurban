import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/dio_api_handler/api_worker.dart';
import 'package:vendor_airurban/model/request/login_request/login_request.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/signup_screen/widget/activation_dialog/activation_dialog.dart';
import 'package:vendor_airurban/utils/dialog_utils.dart';
import 'package:vendor_airurban/utils/session/sessionmanager.dart';

class LoginController extends GetxController {
  ApiWorker apiWorker = ApiWorker();
  final emailTC = TextEditingController();
  final pswrdTC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisible1 = false;

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

  login({BuildContext? context}) async {
    DialogUtils.showLoader(context!);
    LoginRequest loginRequest = LoginRequest(
      emailAddress: emailTC.text.trim(),
      password: pswrdTC.text.trim(),
    );
    print('>>>print ${loginRequest.toJson()}');
    await apiWorker.login(loginRequest).then((value) async {
      if (value.responseType == 'Success') {
        await SessionManager.setBoolValue("isLogin", true);
        await SessionManager.setLoginResponse(value);
        await SessionManager.getLoginResponse().then((value) {
          print('>>>print login response as saved>>>>    ${value!.toJson()}');
        });
          DialogUtils.hideLoader();
          Get.snackbar('Successful', '${value.responseMessage}',
              backgroundColor: textFieldBorderColor,
              snackPosition: SnackPosition.BOTTOM, colorText: primaryTextColor);
        clearAll();
      } else {
          DialogUtils.hideLoader();
          if(value.responseType == 'Error' && value.responseMessage == 'Your account activation is pending and will be completed in 24 hours'){
            ActivationPendingDialog.show(context);
          }else{
            Get.snackbar('Unsuccessful', '${value.responseMessage}',
                backgroundColor: textFieldBorderColor,
                snackPosition: SnackPosition.BOTTOM, colorText: primaryTextColor);
          }
      }
    });
  }

  clearAll() async {
    emailTC.clear();
    pswrdTC.clear();
    Get.delete<LoginController>();
    Get.offAndToNamed(AppRoutes.homeMain);
  }
}
