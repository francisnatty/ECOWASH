import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final double? height;
  final double? width;

  final String icon;
  final VoidCallback? onPressed; // Make onPressed optional
  final Color? iconColor;

  const SvgIcon({
    Key? key,
    required this.icon,
    this.onPressed, // Remove 'required'
    this.iconColor,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        icon,
        height: height?.h,
        width: width?.w,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
