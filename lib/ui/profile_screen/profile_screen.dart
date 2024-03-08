import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/appbar.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/my_theme_button.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/profile_screen/profile_controller.dart';
import 'package:vendor_airurban/ui/profile_screen/widget/portfolio_list.dart';

import '../allow_location/allow_location_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.find();

  @override
  void initState() {
    print('>>>>>>>>${placemarkLocation?.locality ?? ''}');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        id: 'profile',
        init: ProfileController(),
        builder: (profile) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: white,
                appBar: KpAppBar(
                  title: 'Profile',
                  isBack: false,
                  backgroundColor: white,
                  width: AppDimensions.instance!.width/1.2,
                  isMoreOption: true,
                 ),
                body: myBody(profile),
              ),
            ),
          );
        });
  }

  Widget myBody(ProfileController profile) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.instance!.width / 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileContainer(profile),
            kPMediumSizeBox(height: AppDimensions.instance!.height / 50 ),
            personalInfo(profile),
            kPMediumSizeBox(height: AppDimensions.instance!.height / 24 ),
            bankInfo(profile),
            kPMediumSizeBox(height: AppDimensions.instance!.height / 24 ),
            aboutMe(profile),
            kPMediumSizeBox(height: AppDimensions.instance!.height / 24 ),
            portfolio(profile),
            kPMediumSizeBox(height: AppDimensions.instance!.height / 24 ),
            bottomBtn(profile),
            SizedBox(
              height: AppDimensions.instance!.height / 18,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileContainer(ProfileController profile) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.instance!.width / 40,
          vertical: AppDimensions.instance!.height / 50),
      child: Column(
        children: [
          kPMediumSizeBox(height: AppDimensions.instance!.height / 60 ),
          Container(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Container(
                    height:
                    MediaQuery.of(context).size.width / 3.6,
                    width:
                    MediaQuery.of(context).size.width / 3.6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                    ),
                    child:
                    profile.profileImg.isEmpty ?
                    Image.network(
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
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
                    ):
                    Image.file(
                      File(profile.profileImg),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          kPSmallSizeBox(),
          MyRegularText(
            fontSize: NkFontSize.regularFont(regularFont: 15.5),
            label: "Business Name",
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 6,
          ),
          MyRegularText(
            fontSize: NkFontSize.regularFont(regularFont: 15.5),
            label: "Full Name",
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 6,
          ),
          MyRegularText(
            fontSize: NkFontSize.regularFont(regularFont: 15.5),
            label: 'Phone Number',
            fontWeight: FontWeight.w500,
          ),
          kPMediumSizeBox(),
        ],
      ),
    );
  }

  Widget personalInfo(ProfileController profile){
    return Container(
      width: AppDimensions.instance!.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ]),
      child: Column(
          children: [
            MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 14),
              label: "Personal Info",
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 50),
                 bodyContainer(
                     label : 'E-mail',
                     value: 'email@gmail.com'),
              kPMediumSizeBox(
                  height: AppDimensions.instance!.height / 80),
            bodyContainer(
                label : 'Location',
                value: "${placemarkLocation?.street ?? ''}, ${placemarkLocation?.subLocality ?? ''}, ${placemarkLocation?.locality ?? ''}, ${placemarkLocation?.administrativeArea ?? ''},"),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 80),
            bodyContainer(
                label : 'BSB',
            value: 'bsb'),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 80),
            bodyContainer(
                label : 'Passport Number',
                value: 'passport number'),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 80),
            bodyContainer(
                label : 'Driving License',
                value: 'driving license'),
          ]
      ),
    );
  }

  Widget bankInfo(ProfileController profile){
    return Container(
      width: AppDimensions.instance!.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ]),
      child: Column(
          children: [
            MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 14),
              label: "Bank Info",
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 50),
                 bodyContainer(
                     label : 'Bank Name',
                     value: 'bank name'),
              kPMediumSizeBox(
                  height: AppDimensions.instance!.height / 80),
            bodyContainer(
                label : 'Account Name',
                value: 'account name'),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 80),
            bodyContainer(
                label : 'Account Number',
            value: 'account number'),
          ]
      ),
    );
  }

  Widget aboutMe(ProfileController profile){
    return Container(
      width: AppDimensions.instance!.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ]),
      child: Column(
          children: [
            MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 14),
              label: "About Me",
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 50),
            MyCommnonContainer(
              width: AppDimensions.instance!.width,
              color: primaryColor.withOpacity(0.05),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyRegularText(
                  fontSize: NkFontSize.regularFont(regularFont: 13.5),
                  label: 'about me....',
                  align: TextAlign.start,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ]
      ),
    );
  }

  Widget portfolio(ProfileController profile){
    return Container(
      width: AppDimensions.instance!.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 0),
            ),
          ]),
      child: Column(
          children: [
            MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 14),
              label: "Portfolio - Air Care",
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
            kPMediumSizeBox(
                height: AppDimensions.instance!.height / 50),
            PortfolioList(),
          ]
      ),
    );
  }

  Widget bodyContainer({String? label,String? value}) {
    return MyCommnonContainer(
      color: primaryColor.withOpacity(0.05),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 13.5),
              label: '${label.toString()}: ',
              fontWeight: FontWeight.w500,
            ),
            Flexible(
              child: MyRegularText(
                fontSize: NkFontSize.regularFont(regularFont: 13.5),
                label: value.toString(),
                maxlines: 1,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBtn(ProfileController profile){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.instance!.width / 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: MyThemeButton(
              onPressed: () {

              },
              buttonText: 'Recent Activity',
              color: primaryColor,
              fontColor: white,
              fontSize: 13,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              height: AppDimensions.instance!.height / 19,
              width: AppDimensions.instance!.width / 2.8,
              padding: EdgeInsets.zero,
            ),
          ),
          SizedBox(
            width: AppDimensions.instance!.width / 16,
          ),

          Flexible(
            flex: 1,
            child:
            MyThemeButton(
              onPressed: () {
              },
              buttonText: 'Recent Orders',
              color: primaryColor,
              fontColor: white,
              fontSize: 13,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              height: AppDimensions.instance!.height / 19,
              width: AppDimensions.instance!.width / 2.8,
              padding: EdgeInsets.zero,
            )
          ),
        ],
      ),
    );
  }
}