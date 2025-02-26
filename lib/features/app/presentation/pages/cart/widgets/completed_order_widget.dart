import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';
import 'order_item_info.dart';

class CompletedOrderWidget extends StatefulWidget {
  const CompletedOrderWidget({super.key});

  @override
  State<CompletedOrderWidget> createState() => _CompletedOrderWidgetState();
}

class _CompletedOrderWidgetState extends State<CompletedOrderWidget> {
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
                ),
                Wspacing(width: 5),
                Text(
                  'Completed',
                  style: TextStyle(
                    color: AppColors.tertiary,
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
                bgColor: AppColors.secondaryContainer,
                textColor: AppColors.onSurface,
                onPressed: () {},
                title: 'Send Feedback',
              ),
            ),
            const Wspacing(width: 10),
            Expanded(
              child: AppButtons.primary(
                bgColor: AppColors.surfaceContainer,
                // textColor: AppColors.outline,
                textStyle: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.outline,
                ),
                onPressed: () {},
                title: 'Reorder',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
