import 'package:flutter/material.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class KPMaterialBottomNav extends StatefulWidget {
  final int? initialSelectedIndex;
  final void Function(int)? onDestinationSelected;
  final List<Widget> destinations;
  final Color? backgroundColor;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;
  const KPMaterialBottomNav(
      {super.key,
      this.initialSelectedIndex,
      this.onDestinationSelected,
      required this.destinations,
      this.backgroundColor,
      this.indicatorColor,
      this.indicatorShape});

  @override
  State<KPMaterialBottomNav> createState() => _KPMaterialBottomNavState();
}

class _KPMaterialBottomNavState extends State<KPMaterialBottomNav> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        )
      ]),
      child: NavigationBar(
        height: AppDimensions.instance!.height/14.6,
        selectedIndex: widget.initialSelectedIndex ?? _selectedIndex,
        backgroundColor: widget.backgroundColor,
        shadowColor: primaryColor,
        surfaceTintColor: widget.backgroundColor,
        indicatorColor: widget.indicatorColor,
        indicatorShape: widget.indicatorShape,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        animationDuration: const Duration(milliseconds: 500),
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
          widget.onDestinationSelected?.call(value);
        },
        destinations: widget.destinations,
      ),
    );
  }
}
