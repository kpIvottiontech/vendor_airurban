import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/appbar.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_form_field.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/order_screen/order_controller.dart';
import 'package:vendor_airurban/ui/order_screen/widget/order_list.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  OrderController orderController = Get.find();

  @override
  void initState() {
    orderController.tabTextIndexSelected = 0;
    orderController.isCliked = true;
    super.initState();
  }

  @override
  void dispose() {
    orderController.destinationType = '';
    orderController.updateScreen('order');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
        id: 'order',
        init: OrderController(),
        builder: (order) {
          return Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: white,
                appBar: KpAppBar(
                  title: 'Order List',
                  isBack: false,
                  backgroundColor: white,
                  isMoreOption: false,
                  width: AppDimensions.instance!.width / 1.2,
                ),
                body: myBody(order),
              ),
            ),
          );
        });
  }

  Widget myBody(OrderController order) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: AppDimensions.instance!.width / 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kPMediumSizeBox(height: AppDimensions.instance!.height / 50),
          toggleButton(order),
          kPMediumSizeBox(height: AppDimensions.instance!.height / 60),
          searchFieldWidget(order),
          kPMediumSizeBox(height: AppDimensions.instance!.height / 60),
          orderListContainer(),
        ],
      ),
    );
  }

  toggleButton(OrderController order) {
    return Center(
      child: FlutterToggleTab(
        width: AppDimensions.instance!.width / 3.85,
        height: AppDimensions.instance!.height / 16,
        borderRadius: 10,
        selectedIndex: order.tabTextIndexSelected,
        selectedBackgroundColors: [primaryColor],
        unSelectedBackgroundColors: [lightPinkColor],
        selectedTextStyle:
            TextStyle(color: white, fontSize: 14, fontWeight: FontWeight.w500),
        unSelectedTextStyle: TextStyle(
            color: primaryColor, fontSize: 14, fontWeight: FontWeight.w500),
        labels: order.listTextTabToggle,
        selectedLabelIndex: (index) {
          order.tabTextIndexSelected = index;
          print('index >>>>>${order.tabTextIndexSelected}');
          order.updateScreen('order');
          if (order.tabTextIndexSelected == 0) {
            order.isCliked = true;
          } else {
            order.isCliked = false;
          }
        },
        isScroll: false,
      ),
    );
  }

  Widget searchFieldWidget(OrderController order) {
    return Padding(
      padding: EdgeInsets.only(right: AppDimensions.instance!.width / 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 4,
            child: SizedBox(
              height: AppDimensions.instance!.height / 18,
              child: MyFormField(
                labelText: 'Search',
                //fillColor: primaryLight,
                isRequire: true,
                controller: order.searchTC,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                maxLines: 1,
                suffixIcon: GestureDetector(
                    onTap: () {
                      order.searchTC.clear();
                      order.updateScreen('order');
                    },
                    child: Icon(
                      Icons.close,
                      color: order.searchTC.text.isEmpty ? white : greyColor,
                      size: 20,
                    )),
                onChanged: (value) {
                  print('value $value');
                  print('order.searchTC ${order.searchTC.text}');
                  if (value.isEmpty) {
                    order.searchTC.clear();
                  }
                  order.updateScreen('order');
                },
                borderRadius: BorderRadius.circular(8),
                focusedColor: primaryColor,
                enableColor: primaryColor,
                textInputType: TextInputType.emailAddress,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.instance!.width / 26,
                  vertical: AppDimensions.instance!.height / 74,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(width: 2,),
                  GestureDetector(
                    onTap: () {
                      print('popup menu');
                      showMenu(
                        context: context,
                        position: RelativeRect.fromDirectional(
                            textDirection: TextDirection.ltr,
                            start: AppDimensions.instance!.width / 6,
                            top: AppDimensions.instance!.height / 3.8,
                            end: AppDimensions.instance!.width / 40,
                            bottom: 0),
                        items: <PopupMenuEntry>[
                          PopupMenuItem(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('Destination Type >>>>>>> ');
                                    order.destinationType = 'Destination Type';
                                    order.updateScreen('order');
                                    Get.back();
                                  },
                                  child: ListTile(
                                    leading: Icon(Icons.location_on,color: order.destinationType == 'Destination Type'?primaryColor:Colors.black,),
                                      title: MyRegularText(label: 'Destination Type',
                                      fontSize: 14,
                                      align: TextAlign.start,
                                      color: order.destinationType == 'Destination Type'?primaryColor:Colors.black,
                                    )
                                  ),
                                ),
                                Divider(
                                  color: primaryColor.withOpacity(0.1),
                                  height: 0.4,
                                ),
                              ],
                            ),
                            value: 'item1',
                          ),
                          PopupMenuItem(
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('Home >>>>>>> ');
                                    order.destinationType = 'Home';
                                    order.updateScreen('order');
                                    Get.back();
                                  },
                                  child: ListTile(
                                      leading: Icon(Icons.home_filled,color: order.destinationType == 'Home'?primaryColor:Colors.black,),
                                      title: MyRegularText(label: 'Home',
                                        fontSize: 14,
                                        align: TextAlign.start,
                                        color: order.destinationType == 'Home'?primaryColor:Colors.black,
                                      )
                                  ),
                                ),
                                Divider(
                                  color: primaryColor.withOpacity(0.1),
                                  height: 0.4,
                                ),
                              ],
                            ),
                            value: 'item2',
                          ),
                          PopupMenuItem(
                            child: GestureDetector(
                              onTap: () {
                                print('Shop >>>>>>> ');
                                order.destinationType = 'Shop';
                                order.updateScreen('order');
                                Get.back();
                              },
                              child: ListTile(
                                  leading: Icon(Icons.store,color: order.destinationType == 'Shop'?primaryColor:Colors.black,),
                                  title: MyRegularText(label: 'Shop',
                                    fontSize: 14,
                                    align: TextAlign.start,
                                    color: order.destinationType == 'Shop'?primaryColor:Colors.black,
                                  )
                              ),
                            ),
                            value: 'item3',
                          ),
                        ],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                          height: AppDimensions.instance!.height / 34,
                          width: AppDimensions.instance!.height / 34,
                          child: Icon(
                            order.destinationType == 'Home'
                                ? Icons.home_filled
                                : order.destinationType == 'Shop'
                                    ? Icons.store
                                    : Icons.place,
                            color: primaryColor,
                            size: 28,
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                        height: AppDimensions.instance!.height / 34,
                        width: AppDimensions.instance!.height / 34,
                        child: Icon(
                          Icons.search,
                          color: greyColor,
                          size: 28,
                        )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget orderListContainer() {
    return  Expanded(child: OrderList());
  }
}
