import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class AddAndRemoveItemWidget extends StatelessWidget {
  const AddAndRemoveItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all16,
      decoration: BoxDecoration(
          color: AppColors.surface, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'T-Shirt',
                style: AppTextStyles.titleSmall,
              ),
              Row(
                children: [
                  Text(
                    'N',
                    style: AppTextStyles.bodySmaller.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    '500.00',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onSurface,
                      // fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' Per Pcs',
                    style: AppTextStyles.bodySmaller.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              const SvgIcon(icon: AppIcons.minusIcon),
              const Wspacing(width: 7),
              Text(
                '1',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.onSurface,
                ),
              ),
              const Wspacing(width: 7),
              const SvgIcon(icon: AppIcons.plusIcon),
              const Wspacing(width: 10),
              const SvgIcon(icon: AppIcons.deleteIcon),
            ],
          )
        ],
      ),
    );
  }
}
