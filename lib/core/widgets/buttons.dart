import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons {
  static Widget primary({
    required VoidCallback onPressed,
    required String title,
    double? height,
    double? width,
  }) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
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
          backgroundColor: Colors.grey[300],
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
}
