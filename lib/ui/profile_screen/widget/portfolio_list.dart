import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/components/common_size/nk_font_size.dart';
import 'package:vendor_airurban/components/common_size/nk_spacing.dart';
import 'package:vendor_airurban/components/my_common_container.dart';
import 'package:vendor_airurban/components/my_regular_text.dart';
import 'package:vendor_airurban/theme/color/colors.dart';
import 'package:vendor_airurban/ui/profile_screen/profile_controller.dart';

class PortfolioList extends StatefulWidget {
  PortfolioList({super.key});

  @override
  State<PortfolioList> createState() => _PortfolioListState();
}

class _PortfolioListState extends State<PortfolioList> {
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        id: 'profile',
        init: ProfileController(),
        builder: (profile) {
          return SizedBox(
            height: AppDimensions.instance!.height / 5.7,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return kPMediumSizeBox(
                    width: AppDimensions.instance!.width * 0.02,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print('hello >> $index');
                    },
                    child: Column(
                      children: [
                        MyCommnonContainer(
                          height: AppDimensions.instance!.height / 7,
                          width: AppDimensions.instance!.width / 3.2,
                          borderRadius: 10,
                          color: primaryColor,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                                  'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network(
                                  'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
                                  fit: BoxFit.cover,
                                );
                              },
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
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
                            ),

                            /* Image.network(homeController.popularServicesList[index].productImage ??
                                'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
                            fit: BoxFit.cover,
                          ),*/
                          ),
                        ),
                         kPMediumSizeBox(height: 8),
                        Flexible(
                          child: SizedBox(
                            width: AppDimensions.instance!.width / 2.7,
                            child: MyRegularText(
                              fontSize:
                                  NkFontSize.regularFont(regularFont: 13.5),
                              label: 'dsfsfffvfd ',
                              fontWeight: FontWeight.w500,
                              maxlines: 3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
