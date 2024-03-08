import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/appbar.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/my_theme_button.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/time_screen/timeslot_controller.dart';

class EditTimeSlotScreen extends StatefulWidget {
  const EditTimeSlotScreen({super.key});

  State<EditTimeSlotScreen> createState() => _EditTimeSlotScreenState();
}

class _EditTimeSlotScreenState extends State<EditTimeSlotScreen> {
  TimeSlotController timeslotController = Get.find();

  @override
  void initState() {
    timeslotController.tabTextIndexSelected = 0;
    timeslotController.isCliked = true;
    timeslotController.category.clear();
    timeslotController.getCategoryDataList.clear();
    timeslotController.getCategory();

    //btnType = 1,2 1 = edit,2 = view
    timeslotController.btnType = Get.arguments[1];

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimeSlotController>(
        id: 'edittimeslot',
        init: TimeSlotController(),
        builder: (timeslot) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: white,
                appBar: KpAppBar(
                  title: ' Edit Time Slots',
                  isBack: true,
                  backgroundColor: white,
                  isMoreOption: false,
                ),
                body: myBody(timeslot),
              ),
            ),
          );
        });
  }

  Widget myBody(TimeSlotController timeslot) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensions.instance!.width / 30),
      child: timeslotController.category.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kPMediumSizeBox(height: AppDimensions.instance!.height / 50),
                  CategoryContainer(timeslotController),
                  SizedBox(
                    height: AppDimensions.instance!.height / 18,
                  ),
                ],
              ),
            ),
    );
  }

  Widget CategoryContainer(TimeSlotController timeslot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Category 1',
          fontWeight: FontWeight.w500,
          color: black,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyCommnonContainer(
          width: AppDimensions.instance!.width,
          color: textFieldBorderColor1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 13.5),
              label: 'Air Care',
              align: TextAlign.start,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Category 2',
          fontWeight: FontWeight.w500,
          color: black,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyCommnonContainer(
          width: AppDimensions.instance!.width,
          color: textFieldBorderColor1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 13.5),
              label: 'Air Care',
              align: TextAlign.start,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Category 3',
          fontWeight: FontWeight.w500,
          color: black,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyCommnonContainer(
          width: AppDimensions.instance!.width,
          color: textFieldBorderColor1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 13.5),
              label: 'Air Care',
              align: TextAlign.start,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
        MyRegularText(
          fontSize: NkFontSize.regularFont(regularFont: 15),
          label: 'Product',
          fontWeight: FontWeight.w500,
          color: black,
          align: TextAlign.start,
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 90,
        ),
        MyCommnonContainer(
          width: AppDimensions.instance!.width,
          color: textFieldBorderColor1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyRegularText(
              fontSize: NkFontSize.regularFont(regularFont: 13.5),
              label: 'Air Care',
              align: TextAlign.start,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
        Container(
          child: ChipsChoice<String>.multiple(
            value: timeslot.tagseslect,
            onChanged: (val) => setState(() => timeslot.tagseslect = val),
            choiceItems: C2Choice.listFrom<String, String>(
              source: timeslot.options,
              value: (i, v) => v,
              label: (i, v) => v,
              tooltip: (i, v) => v,
            ),
            choiceCheckmark: true,
            choiceStyle: C2ChipStyle(
              checkmarkColor: primaryColor,
              padding: EdgeInsets.all(2.0),
              foregroundStyle: const TextStyle(fontSize: 12.5),
              borderColor: primaryColor,
              height: AppDimensions.instance!.height / 18,
              borderRadius:
              const BorderRadius.all(Radius.circular(6)),
            ),
            //textDirection: TextDirection.rtl,
            wrapped: true,
            alignment: WrapAlignment.start,
            spacing: 8,
            padding: EdgeInsets.symmetric(vertical: 4.0),
          ),
        ),

        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
        timeslotController.btnType == "1"
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: MyThemeButton(
                    onPressed: () {},
                    buttonText: 'Update',
                    color: primaryColor,
                    fontColor: white,
                    fontSize: 13,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: AppDimensions.instance!.height / 19,
                    width: AppDimensions.instance!.width ,
                    padding: EdgeInsets.zero,
                  ),
                ),

              ],
            )
            : Container(),
        SizedBox(
          height: AppDimensions.instance!.height / 50,
        ),
      ],
    );
  }
}
