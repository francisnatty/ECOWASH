import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/payment_option.dart';
import '../widgets/shopdetails_widget.dart';

class CartCheckout extends StatefulWidget {
  const CartCheckout({super.key});

  @override
  State<CartCheckout> createState() => _CartCheckoutState();
}

class _CartCheckoutState extends State<CartCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.materialThemeWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppPaddings.all16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Information',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
                      ),
                      const SvgIcon(
                        icon: AppIcons.cancel,
                      )
                    ],
                  ),
                  const Hspacing(height: 20),
                  const ShopDetailsWidget(),
                  const Hspacing(height: 20),
                  AppButtons.primary(
                    bgColor: AppColors.secondaryContainer,
                    textColor: AppColors.onSecondaryContainer,
                    onPressed: () {},
                    title: 'Select a new Location',
                  ),
                  const Hspacing(height: 20),
                  Text(
                    'Payment Method',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Hspacing(height: 30),
                  const PaymentOptionColumn()
                ],
              ),
            ),
            const Spacer(),
            Container(
              color: AppColors.surfaceContainerLow,
              padding: AppPaddings.all16,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Items(14)',
                        style: AppTextStyles.titleSmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        'N55,500.00',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
                      )
                    ],
                  ),
                  const Hspacing(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery',
                        style: AppTextStyles.titleSmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        'N2,500.00',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
                      )
                    ],
                  ),
                  const Hspacing(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: AppTextStyles.titleSmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        'N57,500.00',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
                      )
                    ],
                  ),
                  const Hspacing(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppButtons.primary(
                      height: 44.h,
                      onPressed: () {},
                      title: 'Checkout',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
