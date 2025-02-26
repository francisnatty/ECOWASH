import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'wwidgets.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgIcon(
          icon: AppIcons.backIcon,
          onPressed: () {
            popWidget(context: context);
          },
        ),
        const Wspacing(width: 20),
        Text(
          title,
          style: AppTextStyles.titleMedium.copyWith(
            color: AppColors.onSurface,
          ),
        ),
      ],
    );
  }
}
