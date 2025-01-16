import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final VoidCallback onpressed;
  final Color? iconColor;

  const SvgIcon({
    super.key,
    required this.icon,
    required this.onpressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: SvgPicture.asset(
        icon,
        colorFilter: iconColor != null
            ? ColorFilter.mode(
                iconColor!,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
  }
}
