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
import 'package:vendor_airurban/components/mydropdownfield.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/signup_screen/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.find();

  @override
  void initState() {
    signUpController.getCategory();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /* navigation(){
    if(Get.arguments[0] == 1){
      print('yes entering');
      Get.offAllNamed(AppRoutes.editProfile);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
        id: 'signUp',
        init: SignUpController(),
        builder: (signUp) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: signUp.getCategoryDataList.isNotEmpty ?
            myBody(signUp): const Center(child: CircularProgressIndicator(color: white,)),
          );
        });
  }

  Widget myBody(SignUpController signUp) {
    return SingleChildScrollView(
      child: Form(
        key: signUp.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.instance!.width / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.instance!.height / 16,
              ),
              Image.asset(
                'assets/images/appbar_logo.png',
                width: AppDimensions.instance!.width / 2,
              ),
              SizedBox(
                height: AppDimensions.instance!.height / 90,
              ),
              MyRegularText(
                fontSize: NkFontSize.regularFont(regularFont: 11.6),
                label: "Streamlined service for your\nconvenience!",
                fontWeight: FontWeight.w300,
                color: white.withOpacity(0.9),
              ),
              SizedBox(
                height: AppDimensions.instance!.height / 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimensions.instance!.width / 20),
                child: MyRegularText(
                  fontSize: NkFontSize.regularFont(regularFont: 26),
                  label: "Sign Up",
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              SizedBox(
                height: AppDimensions.instance!.height / 20,
              ),
              formColumn(signUp),
              SizedBox(
                height: AppDimensions.instance!.height / 36,
              ),
              SignUPBtn(signUp),
              SizedBox(
                height: AppDimensions.instance!.height / 36,
              ),
              loginText(),
              SizedBox(
                height: AppDimensions.instance!.height / 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget formColumn(SignUpController signUp) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Select Category*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        Container(
          height: AppDimensions.instance!.height / 15,
          width: AppDimensions.instance!.width,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: MyDropdownField(
              hint: 'Select City',
              iconSize: 24,
              dropdownItems: signUp.category.map((e) => e.toString()).toList(),
              changedValue:
                  signUp.selectedCategory ?? signUp.category[0].toString(),
              onChanged: (value) {
                signUp.selectedCategory = value as String;
                signUp.updateScreen('signUp');
              },
              fontSize: NkFontSize.regularFont(regularFont: 14),
              fontColor: primaryTextColor,
            ),
          ),
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Business Name*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Business Name',
          controller: signUp.businessNameTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
            if (name == null || name.isEmpty) {
              return 'Please enter business name';
            }else if(!regex.hasMatch(name)){
              return 'Please enter a valid account name';
            }else{
              return null;
            }
            return null;
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Name*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Name',
          controller: signUp.nameTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
            if (name == null || name.isEmpty) {
              return 'Please enter your name';
            }else if(!regex.hasMatch(name)){
              return 'Please enter a valid account name';
            }else{
              return null;
            }
            return null;
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Phone Number*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        Obx(() =>  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyCommnonContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.instance!.width / 40),
              color: white,
              borderRadius: 4,
              child: InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                validator: (p0) {
                  print('On Validator: $p0');
                  if(p0 == null || p0.isEmpty){
                    signUp.phnValidator.value = false;
                    print('phnValidator: ${signUp.phnValidator.value}');
                  }else{
                    signUp.phnValidator.value = true;
                    print('phnValidator: ${signUp.phnValidator.value}');
                  }
                  return null;
                },
                errorMessage: 'Enter a valid phone number',
                selectorButtonOnErrorPadding: 10,
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                maxLength: 10,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: signUp.number,
                textFieldController: signUp.mobileTC,
                formatInput: false,
                countries: ['AU'],
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                inputBorder: InputBorder.none,
                spaceBetweenSelectorAndTextField: 0,
                onSaved: (PhoneNumber number) async {
                  print('On Saved: $number');
                 /* final RegExp regex = RegExp(r'^[0-9]+$');
                  if (regex.hasMatch(signUp.mobileTC.text)) {
                    print('>>>');
                    signUp.signUp(context: context);
                  } else {
                    Get.snackbar('Wrong', 'Enter a valid phone number',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black.withOpacity(0.3));
                  }*/
                },
              ),
            ),
            signUp.phnValidator == false?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: MyRegularText(label: 'Please enter a phone number', color: yellowColor,fontSize: 12,),
                )
              ],
            ) : SizedBox(),
          ],
        ),),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

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
          controller: signUp.emailTC,
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
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          controller: signUp.pswrdTC,
          labelText: 'Password',
          suffixIcon: GestureDetector(
              onTap: () {
                signUp.isVisible1 = !signUp.isVisible1;
                setState(() {});
              },
              child: Icon(
                signUp.isVisible1 ? Icons.visibility : Icons.visibility_off,
                color: primaryColor,
              )),
          obscureText: !signUp.isVisible1,
          maxLines: 1,
          validator: (PassCurrentValue) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,15}$');
            var passNonNullValue = PassCurrentValue ?? "";
            if (passNonNullValue.isEmpty) {
              return ("Please enter password");
            }
            return null;
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Bank Name*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Bank Name',
          controller: signUp.bankNameTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
            if (name == null || name.isEmpty) {
              return 'Please enter bank name';
            }else if(!regex.hasMatch(name)){
              return 'Please enter a valid account name';
            }else{
              return null;
            }
            return null;
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Account Name*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Account Name',
          controller: signUp.accountNameTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
            if (name == null || name.isEmpty) {
              return 'Please enter account name';
            }else if(!regex.hasMatch(name)){
              return 'Please enter a valid account name';
            }else{
              return null;
            }
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Account Number*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Account Number',
          controller: signUp.accountNumberTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            if (name == null || name.isEmpty) {
              return 'Please enter account number';
            }else if(name.length <= 8){
              return 'Please enter a valid account number';
            }
            return null;
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'BSB*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'BSB',
          controller: signUp.bsbTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^\d{6}$');
            if (name == null || name.isEmpty) {
              return 'Please enter BSB(Bank-State-Branch) number';
            }/*else if (!regex.hasMatch(name)) {
              return 'Please enter a valid BSB number';
            }*/else{
              return null;
            }
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Driving License*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Driving License',
          controller: signUp.drivingLicenseTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^[A-Za-z0-9]{6}$');
            if (name == null || name.isEmpty) {
              return 'Please enter driving license';
            }/*else if (!regex.hasMatch(name)) {
              return 'Please enter a valid driving license';
            }*/else{
              return null;
            }
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Passport Number*',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Passport Number',
          controller: signUp.passportNumberTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^[A-Za-z]{2}\d{7}$');
            if (name == null || name.isEmpty) {
              return 'Please enter passport number';
            }/*else if (!regex.hasMatch(name)) {
              return 'Please enter a valid passport number';
            }*/else{
              return null;
            }
          },
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
      ],
    );
  }

  SignUPBtn(SignUpController signUp) {
    return MyThemeButton(
      onPressed: () {
        if (signUp.formKey.currentState!.validate()) {
          signUp.formKey.currentState?.save();
          final RegExp regex =  RegExp(r'^[0-9]{10}$');
          if (regex.hasMatch(signUp.mobileTC.text)) {
            print('>>>');
            signUp.signUp(context: context);
          } else {
            Get.snackbar('Wrong', 'Enter a valid phone number',
                backgroundColor: textFieldBorderColor,
                snackPosition: SnackPosition.BOTTOM, colorText: primaryTextColor);
          }
        }
      },
      buttonText: 'Sign Up',
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

  Widget loginText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyRegularText(
            label: 'Already have an account?',
            fontSize: 12.6,
            color: white,
            fontWeight: FontWeight.w400),
        GestureDetector(
            onTap: () {
              Get.offAndToNamed(AppRoutes.login);
            },
            child: MyRegularText(
                label: ' Login',
                fontSize: 13,
                color: yellowColor,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
