import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/allow_location/allow_location_controller.dart';
import 'package:vendor_airurban/ui/order_screen/order_controller.dart';
import 'package:vendor_airurban/ui/order_screen/widget/order_details_bottomsheet.dart';
import 'package:vendor_airurban/utils/dialog_utils.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OrderController>(
        id: 'order',
        init: OrderController(),
        builder: (order) {
          return  ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: AppDimensions.instance!.height / 30,
                );
              },
              shrinkWrap: true,
              padding: EdgeInsets.only(
                bottom: AppDimensions.instance!.height / 30,
                top: AppDimensions.instance!.height / 60,
              ),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(

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
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 8,
                        child: Row(
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            MyRegularText(
                                              fontSize: NkFontSize
                                                  .regularFont(
                                                  regularFont:
                                                  12.6),
                                              label:
                                              'Order ID:',
                                              align:
                                              TextAlign.left,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: MyRegularText(
                                          fontSize: NkFontSize
                                              .regularFont(
                                              regularFont:
                                              12.8),
                                          label: '123',
                                          color: greyColor,
                                          align: TextAlign.left,
                                          maxlines: 3,
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            MyRegularText(
                                              fontSize: NkFontSize
                                                  .regularFont(
                                                  regularFont:
                                                  12.6),
                                              label: 'Product:',
                                              align:
                                              TextAlign.left,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: MyRegularText(
                                          fontSize: NkFontSize
                                              .regularFont(
                                              regularFont:
                                              12.8),
                                          label: 'abc',
                                          color: greyColor,
                                          align: TextAlign.left,
                                          maxlines: 3,
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            MyRegularText(
                                              fontSize: NkFontSize
                                                  .regularFont(
                                                  regularFont:
                                                  12.6),
                                              label:
                                              'Date & Time:',
                                              align:
                                              TextAlign.left,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: MyRegularText(
                                          fontSize: NkFontSize
                                              .regularFont(
                                              regularFont:
                                              12.8),
                                          label:'06 Mar, 2024 10:00 AM',
                                          color: greyColor,
                                          align: TextAlign.left,
                                          maxlines: 3,
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            MyRegularText(
                                              fontSize: NkFontSize
                                                  .regularFont(
                                                  regularFont:
                                                  12.6),
                                              label: 'Address:',
                                              align:
                                              TextAlign.left,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: MyRegularText(
                                          fontSize: NkFontSize
                                              .regularFont(
                                              regularFont:
                                              12.8),
                                          label:
                                          "${placemarkLocation?.street ?? ''}, ${placemarkLocation?.subLocality ?? ''}, ${placemarkLocation?.locality ?? ''}, ${placemarkLocation?.administrativeArea ?? ''}",
                                          color: greyColor,
                                          align: TextAlign.left,
                                          maxlines: 3,
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            MyRegularText(
                                              fontSize: NkFontSize
                                                  .regularFont(
                                                  regularFont:
                                                  12.6),
                                              label:
                                              'Destination:',
                                              align:
                                              TextAlign.left,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: MyRegularText(
                                          fontSize: NkFontSize
                                              .regularFont(
                                              regularFont:
                                              12.8),
                                          label: 'shop',
                                          color: greyColor,
                                          align: TextAlign.left,
                                          maxlines: 3,
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            MyRegularText(
                                              fontSize: NkFontSize
                                                  .regularFont(
                                                  regularFont:
                                                  12.6),
                                              label: 'Status:',
                                              align:
                                              TextAlign.left,
                                              fontWeight:
                                              FontWeight.w500,
                                              color: primaryColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: MyRegularText(
                                          fontSize: NkFontSize
                                              .regularFont(
                                              regularFont:
                                              12.8),
                                          label: 'pending',
                                          color: greyColor,
                                          align: TextAlign.left,
                                          maxlines: 3,
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      order.tabTextIndexSelected == 2 ?
                      SizedBox():
                      SizedBox(
                        width: 10,
                      ),
                      order.tabTextIndexSelected == 2 ?
                      SizedBox():
                      Flexible(
                        flex: 2,
                        child: Column(
                          children: [
                            order.tabTextIndexSelected == 2 ?
                            SizedBox():
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('hello >> accept');
                                    if (order.tabTextIndexSelected == 0 ) {
                                      DialogUtils.acceptOrderDialog(context,
                                      message: "Are you sure you want to accept this order?",
                                      );
                                    }
                                    else{
                                      orderStatusBottomSheet(context);
                                    }
                                  },
                                  child: MyCommnonContainer(
                                    width: AppDimensions.instance!.width/6.4,
                                    height: AppDimensions.instance!.height/33.8,
                                    borderRadius: 6,
                                    color: order.tabTextIndexSelected == 0?lightGreenColor:greyColor2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 3),
                                      child: MyRegularText(label: order.tabTextIndexSelected == 0?'Accept':'Status',fontSize: 11,color: white),
                                    ),
                                  )
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            order.tabTextIndexSelected == 1 ?
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print('hello >> decline');
                                    DialogUtils.acceptOrderDialog(context,
                                      message: "Are you sure you want to decline this order?",
                                    );
                                  },
                                  child: MyCommnonContainer(
                                    width: AppDimensions.instance!.width/6.4,
                                    borderRadius: 6,
                                    color: red,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 3),
                                      child: MyRegularText(label: 'Decline',fontSize: 11,color: white),
                                    ),
                                  )
                                ),
                              ],
                            ):SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }

  orderStatusBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      isScrollControlled: true,
      showDragHandle: true,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          height: AppDimensions.instance!.height / 2,
          width: AppDimensions.instance!.width,
          child: OrderStatusBottomsheet(),
        );
      },
    );
  }
}
