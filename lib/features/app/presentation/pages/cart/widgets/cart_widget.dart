import 'package:ecowash/features/app/presentation/pages/cart/screens/cart_profile.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';
import 'order_item_info.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

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
            const SvgIcon(
              icon: AppIcons.deleteIcon,
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
        const OrderInfoWidget(title: 'Delivery Time', value: '2 Weeks'),
        const Hspacing(height: 7),
        const OrderInfoWidget(title: 'Total Amount', value: 'N57,500.00'),
        const Hspacing(height: 20),
        Row(
          children: [
            Expanded(
              child: AppButtons.primary(
                bgColor: AppColors.secondaryContainer,
                textColor: AppColors.onSecondaryContainer,
                onPressed: () {},
                title: 'Add a note',
              ),
            ),
            const Wspacing(width: 10),
            Expanded(
              child: AppButtons.primary(
                onPressed: () {
                  goTo(context: context, newScreen: const CartProfile());
                },
                title: 'Checkout',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
