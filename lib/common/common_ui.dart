import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/common/app_colors.dart';
import 'package:rick_morty/common/app_fonts.dart';
import 'package:rick_morty/common/font_sizes.dart';
import 'package:rick_morty/global.dart';
import 'package:shimmer/shimmer.dart';

/// A utility class that holds common UI elements used throughout the app.
class CommonUi {
  /// A custom text style that can be used throughout the app.
  static TextStyle customTextStyle({
    double fontSize = AppFontSizes.font14,
    Color color = AppColors.colorBlack,
    String fontFamily = AppFonts.fontMedium,
    double? height,
    Color? decorationColor,
    FontWeight? fontWeight,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      decoration: textDecoration,
      decorationColor: decorationColor,
      height: height,
    );
  }

  /// A custom decoration for containers and other widgets with shadow and rounded corners.
  static BoxDecoration customBoxDecoration({
    Color color = AppColors.colorWhite,
    double borderRadius = 10,
    Color shadowColor = Colors.black12,
    double blurRadius = 7,
    double spreadRadius = 0,
    Offset offset = const Offset(0, 0),
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
  }

  /// A custom shimmer widget that can be used as a loading placeholder.
  static Widget customShimmer({double width = double.infinity, double height = 180, double borderRadius = 10.0}) {
    return Shimmer.fromColors(
      baseColor: AppColors.colorShimmerBase,
      highlightColor: AppColors.colorShimmerHighlight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: Global.appHzPadding,vertical: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.colorWhite,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  /// A custom network image widget that uses CachedNetworkImage for loading images.
  static customNetworkImage({
    String imageUrl = "",
    void Function()? onTap,
    double height = 70,
    double width = 70,
    bool isPadding = true,
    Color color = AppColors.colorWhite,
    double borderRadius = 4,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: height,
        width: width,
        imageUrl: imageUrl,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: AppColors.colorShimmerBase,
          highlightColor: AppColors.colorShimmerHighlight,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: color,
              border:
              Border.all(color: AppColors.colorBlack.withOpacity(0.04)),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              color: color,
              child: Icon(
                CupertinoIcons.photo,
                color: AppColors.colorBlack,
                size: width / 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
