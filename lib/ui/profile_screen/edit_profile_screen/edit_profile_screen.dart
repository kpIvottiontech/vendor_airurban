import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:vendor_airurban/components/appbar.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_form_field.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/my_theme_button.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/profile_screen/edit_profile_screen/edit_profile_controller.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController = Get.find();

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
    return GetBuilder<EditProfileController>(
        id: 'editProfile',
        init: EditProfileController(),
        builder: (editProfile) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: primaryColor,
                appBar: KpAppBar(
                  title: 'Edit Profile',
                  isBack: true,
                  backgroundColor: white,
                  width: AppDimensions.instance!.width/1.26,
                  isMoreOption: false,
                ),
                body: myBody(editProfile),
              ),
            ),
          );
        });
  }

  Widget myBody(EditProfileController editProfile) {
    return SingleChildScrollView(
      child: Form(
        key: editProfile.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimensions.instance!.width / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimensions.instance!.height / 50,
              ),
              profileContainer(editProfile),
              SizedBox(
                height: AppDimensions.instance!.height / 60,
              ),
              formColumn(editProfile),
              SizedBox(
                height: AppDimensions.instance!.height / 36,
              ),
              EditProfileBtn(editProfile),
              SizedBox(
                height: AppDimensions.instance!.height / 36,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profileContainer(EditProfileController profile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.instance!.width / 40,
        //vertical: AppDimensions.instance!.height / 50
      ),
      child:  GestureDetector(
        onTap: () async {
          print('tapped');
          await profile.bottomSheet(context);
          /* if (profile.scaffoldKey.currentState != null) {
            await profile.bottomSheet(context);
          }*/
        },
        child: Stack(
          children: [
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Container(
                      height: AppDimensions.instance!.width / 3.6,
                      width: AppDimensions.instance!.width / 3.6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: white,
                      ),
                      child: profile.profileImg.isEmpty ?
                      Icon(
                        Icons.person_rounded,
                        size: AppDimensions.instance!.width / 4.8,
                        color: primaryColor,
                      )
                      /*Image.network(
                        // profile.user.profileImg != ''? profile.user.profileImg.toString() :
                        'https://cdn-icons-png.flaticon.com/512/6073/6073874.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network('https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',fit: BoxFit.cover,);
                        },
                        loadingBuilder: (BuildContext context,
                            Widget child,
                            ImageChunkEvent?
                            loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          else {
                            return Center(
                              child:
                              CircularProgressIndicator(
                                value: loadingProgress
                                    .expectedTotalBytes !=
                                    null
                                    ? loadingProgress
                                    .cumulativeBytesLoaded /
                                    loadingProgress
                                        .expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        },
                      )*/:
                      Image.file(
                        File(profile.profileImg),
                        fit: BoxFit.cover,
                      ) ),
                ),
              ),
            ),
            Positioned(
                right: AppDimensions.instance!.width / 3.3,
                top: AppDimensions.instance!.height / 10.7,
                child: MyCommnonContainer(
                    height: AppDimensions.instance!.width / 15,
                    width: AppDimensions.instance!.width / 15,
                    color: yellowColor,
                    borderRadius: 500,
                    child: Icon(Icons.edit, color: primaryColor,size: 16,))),
          ],
        ),
      ),
    );
  }

  Widget formColumn(EditProfileController editProfile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Business Name',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Business Name',
          controller: editProfile.businessNameTC,
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
          label: 'Name',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Name',
          controller: editProfile.nameTC,
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
          label: 'Phone Number',
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
                    editProfile.phnValidator.value = false;
                    print('phnValidator: ${editProfile.phnValidator.value}');
                  }else{
                    editProfile.phnValidator.value = true;
                    print('phnValidator: ${editProfile.phnValidator.value}');
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
                initialValue: editProfile.number,
                textFieldController: editProfile.mobileTC,
                formatInput: false,
                countries: ['AU'],
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                inputBorder: InputBorder.none,
                spaceBetweenSelectorAndTextField: 0,
                onSaved: (PhoneNumber number) async {
                  print('On Saved: $number');
                 /* final RegExp regex = RegExp(r'^[0-9]+$');
                  if (regex.hasMatch(editProfile.mobileTC.text)) {
                    print('>>>');
                    editProfile.editProfile(context: context);
                  } else {
                    Get.snackbar('Wrong', 'Enter a valid phone number',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black.withOpacity(0.3));
                  }*/
                },
              ),
            ),
            editProfile.phnValidator == false?
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
          label: 'Email',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Email',
          controller: editProfile.emailTC,
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
          label: 'Bank Name',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Bank Name',
          controller: editProfile.bankNameTC,
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
          label: 'Account Name',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Account Name',
          controller: editProfile.accountNameTC,
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
          label: 'Account Number',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Account Number',
          controller: editProfile.accountNumberTC,
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
          label: 'BSB',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'BSB',
          controller: editProfile.bsbTC,
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
          label: 'Driving License',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Driving License',
          controller: editProfile.drivingLicenseTC,
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
          label: 'Passport Number',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Passport Number',
          controller: editProfile.passportNumberTC,
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

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Location',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'Location',
          controller: editProfile.locationTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 1,
          textInputType: TextInputType.name,
          validator: (name) {
            RegExp regex = RegExp(r'^[A-Za-z]{2}\d{7}$');
            if (name == null || name.isEmpty) {
              return 'Please enter location';
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

        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'About Us',
          fontWeight: FontWeight.w500,
          color: white,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyFormField(
          labelText: 'About Us',
          controller: editProfile.aboutUsTC,
          alignLabelWithHint: true,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 3,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
      ],
    );
  }

  EditProfileBtn(EditProfileController editProfile) {
    return MyThemeButton(
      onPressed: () {
        if (editProfile.formKey.currentState!.validate()) {
          editProfile.formKey.currentState?.save();
          final RegExp regex =  RegExp(r'^[0-9]{10}$');
          if (regex.hasMatch(editProfile.mobileTC.text)) {
            print('>>>');
           // editProfile.editProfile(context: context);
          } else {
            Get.snackbar('Wrong', 'Enter a valid phone number',
                backgroundColor: textFieldBorderColor,
                snackPosition: SnackPosition.BOTTOM, colorText: primaryTextColor);
          }
        }
      },
      buttonText: 'Edit Profile',
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
}
