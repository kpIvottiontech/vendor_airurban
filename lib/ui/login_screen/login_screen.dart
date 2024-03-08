import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_form_field.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/my_theme_button.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/login_screen/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        id: 'login',
        init: LoginController(),
        builder: (login) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: myBody(login),
          );
        });
  }

  Widget myBody(LoginController login){
    return SingleChildScrollView(
      child: Form(
        key: login.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.instance!.width / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.instance!.height / 8,
              ),
              Image.asset(
                'assets/images/appbar_logo.png',
                width: AppDimensions.instance!.width / 1.6,
              ),
              SizedBox(
                height: AppDimensions.instance!.height / 80,
              ),
              MyRegularText(
                fontSize: NkFontSize.regularFont(regularFont: 13),
                label: "Streamlined service for your\nconvenience!",
                fontWeight: FontWeight.w300,
                color: white.withOpacity(0.9),
              ),
              SizedBox(
                height: AppDimensions.instance!.height / 26,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.instance!.width / 20),
                child: MyRegularText(
                  fontSize: NkFontSize.regularFont(regularFont: 26),
                  label:
                  "Login",
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              SizedBox(
                height: AppDimensions.instance!.height / 18,
              ),
              formColumn(login),
              SizedBox(
                height: AppDimensions.instance!.height / 36,
              ),
              loginBtn(login),
              SizedBox(
                height: AppDimensions.instance!.height / 18,
              ),
              registerText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget formColumn(LoginController login) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Email*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Email',
          controller: login.emailTC,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.emailAddress,
          validator: (name) {
            if (name == null || name.trim().isEmpty) {
              return 'Please enter email address';
            }
            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(name)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Password*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 80,
        ),
        MyFormField(
          controller: login.pswrdTC,
          labelText: 'Password',
          suffixIcon: GestureDetector(
              onTap: () {
                login.isVisible1 = !login.isVisible1;
                setState(() {});
              },
              child: Icon(
                login.isVisible1 ? Icons.visibility : Icons.visibility_off,
                color: primaryColor,
              )),
          obscureText: !login.isVisible1,
          maxLines: 1,
          validator: (PassCurrentValue) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,20}$');

            if (PassCurrentValue!.isEmpty) {
              return "Please enter password";
            } else if (PassCurrentValue!.length < 8) {
              print('password length is less than 8');
              return "Please enter atleast 8 character password";
            } else {
              if (!regex.hasMatch(PassCurrentValue)) {
                return ("Password should contain upper, lower, digit\nand Special character ");
              } else {
                return null;
              }
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: MyRegularText(
              label: 'Forgot Password?',
              fontWeight: FontWeight.w500,
              color: white,
              fontSize: 14,
            )),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
      ],
    );
  }

  loginBtn(LoginController login) {
    return MyThemeButton(
      onPressed: () {
        if (login.formKey.currentState!.validate()) {
          login.formKey.currentState?.save();
          //login.login(context: context);
          Get.offAndToNamed(AppRoutes.homeMain);
        }
      },
      buttonText: 'Login',
      color: white,
      fontColor: primaryColor,
      fontSize: 14.5,
      fontWeight: FontWeight.bold,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      height: AppDimensions.instance!.height / 18,
      width: AppDimensions.instance!.width / 2.5,
      padding: EdgeInsets.zero,
    );
  }

  Widget registerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyRegularText(
            label: 'Dont have an account?',
            fontSize: 12.6,
            color: white,
            fontWeight: FontWeight.w400),
        GestureDetector(
            onTap: () {
              Get.offAndToNamed(AppRoutes.signUp);
            },
            child: MyRegularText(
                label: ' Register Instead',
                fontSize: 13,
                color: yellowColor,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
