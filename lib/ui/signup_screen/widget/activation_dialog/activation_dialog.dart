import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class ActivationPendingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              MyRegularText(label: 'Account Activation Pending', color: primaryColor, fontSize: 18, fontWeight: FontWeight.w500),
              Lottie.asset(
                'assets/dot_lottie.json',
                width: AppDimensions.instance!.width / 8,
                height: AppDimensions.instance!.height / 18,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyRegularText(label:  'Your account activation is pending and will be completed within 24 hours.', color: primaryTextColor, fontSize: 12.6, fontWeight: FontWeight.w400,maxlines: 10,),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

