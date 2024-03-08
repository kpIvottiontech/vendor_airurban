import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/appbar.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/common_size/nk_general_size.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/components/mydropdownfield.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/time_screen/timeslot_controller.dart';
import 'package:vendor_airurban/utils/dK_dropDownMultiSelectNew.dart';

class TimeSlotScreen extends StatefulWidget {
  const TimeSlotScreen({super.key});

  State<TimeSlotScreen> createState() => _TimeSlotScreenState();
}

class _TimeSlotScreenState extends State<TimeSlotScreen> {
  TimeSlotController timeslotController = Get.find();

  @override
  void initState() {
    timeslotController.tabTextIndexSelected = 0;
    timeslotController.isCliked = true;
    timeslotController.category.clear();
    timeslotController.getCategoryDataList.clear();
    timeslotController.getCategory();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimeSlotController>(
        id: 'timeslot',
        init: TimeSlotController(),
        builder: (timeslot) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: white,
                appBar: KpAppBar(
                  title: 'Time Slots',
                  isBack: false,
                  backgroundColor: white,
                  isMoreOption: false,
                  width: AppDimensions.instance!.width / 1.2,
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
          EdgeInsets.symmetric(horizontal: AppDimensions.instance!.width / 26),
      child: timeslotController.category.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kPMediumSizeBox(height: AppDimensions.instance!.height / 50),
                  toggleButton(timeslotController),
                  kPMediumSizeBox(height: AppDimensions.instance!.height / 50),
                  timeslot.tabTextIndexSelected == 0
                      ? TimeListContainer(timeslotController)
                      : CategoryContainer(timeslotController),
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
        Container(
          height: AppDimensions.instance!.height / 15,
          width: AppDimensions.instance!.width,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: MyCommnonContainer(
            width: AppDimensions.instance!.width,
            color: textFieldBorderColor1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyDropdownField(
                hint: 'Category 2',
                iconSize: 24,
                dropdownItems:
                    timeslot.category.map((e) => e.toString()).toList(),
                changedValue: timeslot.selectedCategory ??
                    timeslot.category[0].toString(),
                onChanged: (value) {
                  timeslot.selectedCategory = value as String;
                  timeslot.updateScreen('timeslot');
                },
                fontSize: NkFontSize.regularFont(regularFont: 14),
                fontColor: primaryTextColor,
              ),
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
        Container(
          height: AppDimensions.instance!.height / 15,
          width: AppDimensions.instance!.width,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: MyCommnonContainer(
            width: AppDimensions.instance!.width,
            color: textFieldBorderColor1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MyDropdownField(
                hint: 'Category 2',
                iconSize: 24,
                dropdownItems:
                    timeslot.category.map((e) => e.toString()).toList(),
                changedValue: timeslot.selectedCategory ??
                    timeslot.category[0].toString(),
                onChanged: (value) {
                  timeslot.selectedCategory = value as String;
                  timeslot.updateScreen('timeslot');
                },
                fontSize: NkFontSize.regularFont(regularFont: 14),
                fontColor: primaryTextColor,
              ),
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
        Container(
          height: AppDimensions.instance!.height / 15,
          width: AppDimensions.instance!.width,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: MyCommnonContainer(
            width: AppDimensions.instance!.width,
            color: textFieldBorderColor1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButtonHideUnderline(
                child: DropDownMultiSelectNew(
                  options: timeslot.getCategoryDataList
                      .map((e) => (e.name))
                      .toList(),
                  selectedValues: timeslot.selectedProduct,
                  onChanged: (value) {
                    timeslot.selectedProduct = value;
                    timeslot.updateScreen('timeslot');
                  },
                  whenEmpty: "Select",
                  icon: Icon(null),
                  isDense: false,
                  enabled: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                      )),
                ),
              ),
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
              borderRadius: const BorderRadius.all(Radius.circular(6)),
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
      ],
    );
  }

  Widget TimeListContainer(TimeSlotController timeslot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                width: AppDimensions.instance!.width,
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 4,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            timelistbodyContainer(
                                label: 'Category 1', value: 'Air Event'),
                            timelistbodyContainer(
                                label: 'Category 2', value: 'Air Event one'),
                            timelistbodyContainer(
                                label: 'Category 3', value: 'Air Event Test'),
                            timelistbodyContainer(
                                label: 'Product', value: 'E Festo Event'),
                            SizedBox(
                              height: 5,
                            ),
                          ]),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.toNamed('/edittime', arguments: ["", "1"]);
                              },
                              child: Icon(Icons.edit,
                                  size: KPGeneralSize.kPIconSize(),
                                  color: primaryColor)),
                          SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                              onTap: () {
                                // Get.toNamed('/edittime',arguments: ["","2"]);
                              },
                              child: Icon(Icons.delete,
                                  size: KPGeneralSize.kPIconSize(),
                                  color: primaryColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 0,
            );
          },
        )
      ],
    );
  }

  Widget timelistbodyContainer(
      {String? label, String? value, double? fontSize}) {
    return MyCommnonContainer(
      // color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                // color: Colors.yellow,
                child: Row(
                  children: [
                    MyRegularText(
                      fontSize:
                          NkFontSize.regularFont(regularFont: fontSize ?? 12),
                      label: '${label.toString()}: ',
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                //color: Colors.red,
                child: Row(
                  children: [
                    MyRegularText(
                      fontSize: NkFontSize.regularFont(regularFont: 15),
                      label: value.toString(),
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  toggleButton(TimeSlotController timeslot) {
    return FlutterToggleTab(
      width: AppDimensions.instance!.width / 4.21,
      height: AppDimensions.instance!.height / 16,
      borderRadius: 10,
      selectedIndex: timeslot.tabTextIndexSelected,
      selectedBackgroundColors: [primaryColor],
      unSelectedBackgroundColors: [lightPinkColor],
      selectedTextStyle:
          TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500),
      unSelectedTextStyle: TextStyle(
          color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500),
      labels: timeslot.listTextTabToggle,
      selectedLabelIndex: (index) {
        timeslot.tabTextIndexSelected = index;
        print('index >>>>>${timeslot.tabTextIndexSelected}');
        timeslot.updateScreen('timeslot');

        if (timeslot.tabTextIndexSelected == 0) {
          timeslot.isCliked = true;
        } else {
          timeslot.isCliked = false;
        }
      },
      isScroll: false,
    );
  }
}
