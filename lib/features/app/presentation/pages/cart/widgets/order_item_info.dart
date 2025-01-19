import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';

class OrderInfoWidget extends StatelessWidget {
  final String title;
  final String value;

  const OrderInfoWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.titleSmall.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.onSurface,
          ),
        )
      ],
    );
  }
}
