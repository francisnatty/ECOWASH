import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit fit; // Remove nullable (?) and provide default value

  final String icon;
  final VoidCallback? onPressed;
  final Color? iconColor;

  const SvgIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.iconColor,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SvgPicture.asset(
        icon,
        height: height,
        width: width,
        fit: fit,
        colorFilter: iconColor != null
            ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
            : null,
      ),
    );
  }
}
