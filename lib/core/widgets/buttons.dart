import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_constants.dart';

class AppButtons {
  static Widget primary({
    required VoidCallback onPressed,
    required String title,
    double? height,
    double? width,
    TextStyle? textStyle,
    Color? bgColor,
    Color? textColor,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: bgColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle ??
                TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
          ),
        ),
      ),
    );
  }

  static Widget loading({
    double? height,
    double? width,
    double? radius,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.green[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
        ),
        onPressed: () {},
        child: SizedBox(
          height: 25.h,
          width: 25.w,
          child: const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.0,
          ),
        ),
      ),
    );
  }

  static Widget iconButton({
    required VoidCallback onPressed,
    required String title,
    double? height,
    double? width,
    TextStyle? textStyle,
    Color? bgColor,
    Color? textColor,
    required String icon,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: bgColor ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(icon: icon),
            const Wspacing(width: 10),
            Text(
              title,
              style: textStyle ??
                  TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
