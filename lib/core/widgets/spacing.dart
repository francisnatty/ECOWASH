import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hspacing extends StatelessWidget {
  final double height;
  const Hspacing({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class Wspacing extends StatelessWidget {
  final double width;

  const Wspacing({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}
