import 'package:flutter/material.dart';
import 'package:vendor_airurban/components/common_size/common_hight_width.dart';

/// *********** General use Sizes  ***************

SizedBox kPChildWrappedSizeBox({
  Widget? child,
  double? height,
  double? width,
}) =>
    SizedBox(
      height: height,
      width: width,
      child: child,
    );

SizedBox kPExtraSmallSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .08,
      width: width ?? AppDimensions.instance!.width * .08,
      child: child,
    );

SizedBox kPSmallSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .010,
      width: width ?? AppDimensions.instance!.width * .010,
      child: child,
    );

SizedBox kPMediumSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .028,
      width: width ?? AppDimensions.instance!.width * .020,
      child: child,
    );

SizedBox kPLargeSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .086,
      width: width ?? AppDimensions.instance!.width * .086,
      child: child,
    );

SizedBox kPExtraLargeSizeBox({
  double? height,
  double? width,
  Widget? child,
}) =>
    SizedBox(
      height: height ?? AppDimensions.instance!.height * .16,
      width: width ?? AppDimensions.instance!.width * .16,
      child: child,
    );

/// *********** General use Padding  ***************

EdgeInsets kPSmallPadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .02,
      right: right ?? AppDimensions.instance!.width * .02,
      bottom: bottom ?? AppDimensions.instance!.height * .02,
      left: left ?? AppDimensions.instance!.width * .02,
    );

EdgeInsets kPMediumPadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .04,
      right: right ?? AppDimensions.instance!.width * .04,
      bottom: bottom ?? AppDimensions.instance!.height * .04,
      left: left ?? AppDimensions.instance!.width * .04,
    );

EdgeInsets kPLargePadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .012,
      right: right ?? AppDimensions.instance!.width * .012,
      bottom: bottom ?? AppDimensions.instance!.height * .012,
      left: left ?? AppDimensions.instance!.width * .012,
    );
EdgeInsets kPRegularPadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .020,
      right: right ?? AppDimensions.instance!.width * .030,
      bottom: bottom ?? AppDimensions.instance!.height * .020,
      left: left ?? AppDimensions.instance!.width * .030,
    );

EdgeInsets kPExtraLargePadding({
  double? top,
  double? right,
  double? bottom,
  double? left,
}) =>
    EdgeInsets.only(
      top: top ?? AppDimensions.instance!.height * .14,
      right: right ?? AppDimensions.instance!.width * .14,
      bottom: bottom ?? AppDimensions.instance!.height * .14,
      left: left ?? AppDimensions.instance!.width * .14,
    );

EdgeInsets kPSymmetricPadding({
  double? horizontal,
  double? vertical,
}) =>
    EdgeInsets.symmetric(
      horizontal: horizontal ?? AppDimensions.instance!.width * .020,
      vertical: vertical ?? AppDimensions.instance!.height * .020,
    );
