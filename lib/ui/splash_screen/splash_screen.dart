import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var duration = const Duration(seconds: 6);
    Timer(duration, getNavigationPage);
  }

  getNavigationPage() {
    Get.offAllNamed(AppRoutes.allowLocationScreen);
  }


  @override
  Widget build(BuildContext context) {
    print('check>>');
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: myBody(),
      ),
    );
  }

  Widget myBody(){
    return MyCommnonContainer(
      color: primaryColor,
      child: Center(child: Padding(
        padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width/10),
        child: Image.asset('assets/images/appbar_logo.png',width: MediaQuery.of(context).size.width,),
      )),
    );
  }
}
