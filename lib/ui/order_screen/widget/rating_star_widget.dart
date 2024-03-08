import 'package:flutter/material.dart';
import 'package:vendor_airurban/theme/color/colors.dart';

class RatingStarWidget extends StatefulWidget {
  double? rating;
  double? size;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  RatingStarWidget({this.rating,this.size,this.crossAxisAlignment,this.mainAxisAlignment});

  @override
  State<RatingStarWidget> createState() => _RatingStarWidgetState();
}

class _RatingStarWidgetState extends State<RatingStarWidget> {
  int totalStars = 5;
  late int fullStars = 0;
  late bool hasHalfStar = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullStars = widget.rating!.floor();
    hasHalfStar = (widget.rating! - fullStars) >= 0.5;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: widget.mainAxisAlignment ?? MainAxisAlignment.start,
      children: List.generate(
        totalStars,
        (index) {
          if (index < fullStars) {
            return Icon(
              Icons.star,
              color: primaryTextColor,
              size: widget.size ?? 12,
            );
          } else if (index == fullStars && hasHalfStar) {
            return Icon(
              Icons.star_half,
              color: primaryTextColor,
              size: widget.size ?? 12,
            );
          } else {
            return Icon(
              Icons.star_border,
              color: primaryTextColor,
              size: widget.size ?? 12,
            );
          }
        },
      ),
    );
  }
}
