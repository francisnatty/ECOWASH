import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class ShopDetailsWidget extends StatelessWidget {
  const ShopDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all16,
      decoration: BoxDecoration(
        color: AppColors.inverseOnSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unguwan Bado',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    'Current Location',
                    style: AppTextStyles.bodySmallest.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  )
                ],
              ),
            ],
          ),
          const Divider(
            color: AppColors.outlineVariant,
            thickness: 0.75,
          ),
          const Hspacing(height: 20),
          Text(
            'Flat 4, Road G, Malali New Extension Kaduna, Nigeria.',
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.onSurface,
            ),
          ),
          const Hspacing(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SvgIcon(icon: AppIcons.tele),
                  const Wspacing(width: 7),
                  Text(
                    '+2348139414056',
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
              const SvgIcon(
                icon: AppIcons.edit,
              )
            ],
          )
        ],
      ),
    );
  }
}
