import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';
import 'order_item_info.dart';

class ActiveOrderWidget extends StatelessWidget {
  const ActiveOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order 23Dx45',
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  'Waleed Washanic',
                  style: AppTextStyles.bodySmallest.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                )
              ],
            ),
            const Row(
              children: [
                SvgIcon(
                  icon: AppIcons.boxIcon,
                  iconColor: AppColors.onErrorContainer,
                ),
                Wspacing(width: 5),
                Text(
                  'Pending',
                  style: TextStyle(
                    color: AppColors.onErrorContainer,
                  ),
                )
              ],
            )
          ],
        ),
        const Divider(
          color: AppColors.outlineVariant,
          thickness: 0.75,
        ),
        const OrderInfoWidget(title: 'Items', value: '10'),
        const Hspacing(height: 7),
        const OrderInfoWidget(title: 'Delivery Type', value: 'Pickup'),
        const Hspacing(height: 7),
        const OrderInfoWidget(
            title: 'Pickup Date', value: '22nd December, 2024'),
        const Hspacing(height: 7),
        const OrderInfoWidget(title: 'Time to Delivery', value: '13:23:45:45s'),
        const Hspacing(height: 7),
        const OrderInfoWidget(title: 'Total Amount', value: 'N57,500.00'),
        const Hspacing(height: 20),
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                bgColor: AppColors.errorContainer,
                textColor: AppColors.error,
                onPressed: () {},
                title: 'Report Order',
              ),
            ),
            const Wspacing(width: 10),
            Expanded(
              child: AppButtons.primary(
                onPressed: () {},
                title: 'Track Order',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
