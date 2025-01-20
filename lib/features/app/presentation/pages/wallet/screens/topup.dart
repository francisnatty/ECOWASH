import 'package:ecowash/core/utils/constants/styles.dart';
import 'package:ecowash/core/widgets/spacing.dart';
import 'package:ecowash/core/widgets/textfields.dart';
import 'package:ecowash/features/app/presentation/pages/cart/widgets/payment_option.dart';
import 'package:ecowash/features/app/presentation/pages/wallet/widgets/saved_accounts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: AppPaddings.all16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgIcon(
                        icon: AppIcons.backIcon,
                        onPressed: () {
                          popWidget(context: context);
                        },
                      ),
                      const Wspacing(width: 20),
                      Text(
                        'Top Up',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const Hspacing(height: 30),
                  Text(
                    'Wallet ID',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  TextFields.normalTextField(
                    hintText: 'Wallet ID',
                    controller: controller,
                  ),
                  const Hspacing(height: 15),
                  Text(
                    'Enter amount',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),

                  TextFields.normalTextField(
                    hintText: 'Amount',
                    controller: controller,
                  ),
                  const Hspacing(height: 10),
                  Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: List.generate(5, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.only(
                          top: 10.h,
                          bottom: 10.w,
                          left: 8.w,
                          right: 8.w,
                        ),
                        child: Text(
                          'N100.00',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      );
                    }),
                  ),
                  const Hspacing(height: 20),
                  Text(
                    'Saved Accounts',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onPrimaryContainer,
                    ),
                  ),
                  // const Hspacing(height: 20),
                  const SavedAccountWidget(),
                  const Hspacing(height: 20),
                  Text(
                    'Others',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onPrimaryContainer,
                    ),
                  ),
                  const Hspacing(height: 20),
                  PaymentOptionColumn(),
                ],
              ),
            ),
            const Spacer(),
            Container(
              color: AppColors.surfaceContainerLow,
              padding: AppPaddings.all16,
              child: AppButtons.primary(
                height: 44.h,
                bgColor: AppColors.primary,
                textStyle: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.materialThemeWhite,
                ),
                onPressed: () {
                  // goTo(context: context, newScreen: CartCheckout());
                },
                title: 'Proceed',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
