import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_airurban/routes/routes.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class MyPopupMenu extends StatefulWidget {
  const MyPopupMenu({super.key});

  @override
  State<MyPopupMenu> createState() => _MyPopupMenuState();
}

class _MyPopupMenuState extends State<MyPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: white,
      position: PopupMenuPosition.under,
      enabled: true,
      onSelected: (value) {
        if (value == 'logout') {
          // Perform logout action
          print('Logout');
        } else if (value == 'editProfile') {
          // Navigate to edit profile screen
          print('Edit Profile');
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<String>(
            value: 'editProfile',
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    print('Edit Profile >>>>>>> ');
                    Get.back();
                    Get.toNamed(AppRoutes.editprofile);
                  },
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit Profile'),
                  ),
                ),
                Divider(
                  color: primaryColor.withOpacity(0.1),
                  height: 0.4,
                ),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'logout',
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
            ),
          ),
        ];
      },
    );
  }
}