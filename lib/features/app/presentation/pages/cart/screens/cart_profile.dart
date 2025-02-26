import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/app/presentation/pages/cart/screens/cart_checkout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/add_remove_widget.dart';

class CartProfile extends StatelessWidget {
  const CartProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.materialThemeWhite,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgIcon(
                        icon: AppIcons.backIcon,
                        onPressed: () {},
                      ),
                      SvgIcon(
                        icon: AppIcons.favourite,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Hspacing(height: 25),
                  Text(
                    'Delivery Type',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Hspacing(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SelectionContainerWidget(
                          onPressed: () {},
                          title: 'Pickup',
                        ),
                      ),
                      const Wspacing(width: 10),
                      Expanded(
                        child: SelectionContainerWidget(
                          onPressed: () {},
                          title: 'Pickup',
                        ),
                      ),
                    ],
                  ),
                  const Hspacing(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Picked Date',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Row(
                          children: [
                            const SvgIcon(icon: AppIcons.plusIcon),
                            const Wspacing(width: 2),
                            Text(
                              'Add',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Hspacing(height: 20),
                  Text(
                    'Delivery Time',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Hspacing(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SelectionContainerWidget(
                          onPressed: () {},
                          title: '1-2 Weeks',
                        ),
                      ),
                      const Wspacing(width: 10),
                      Expanded(
                        child: SelectionContainerWidget(
                          onPressed: () {},
                          title: '48 Hours(+1,500)',
                        ),
                      ),
                    ],
                  ),
                  const Hspacing(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return const AddAndRemoveItemWidget();
                      },
                      separatorBuilder: (context, index) {
                        return const Hspacing(height: 20);
                      },
                      itemCount: 10,
                    ),
                  ),
                  const Hspacing(height: 10),

                  // const AddAndRemoveItemWidget(),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero, // Remove padding here
            child: Container(
              color: AppColors.surfaceContainerLow,
              padding: AppPaddings.all16,
              child: AppButtons.primary(
                height: 44.h,
                bgColor: AppColors.surfaceContainer,
                textStyle: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.outline,
                ),
                onPressed: () {
                  goTo(context: context, newScreen: const CartCheckout());
                },
                title: 'Proceed',
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class SelectionContainerWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const SelectionContainerWidget({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 44.h,
        padding: AppPaddings.all10,
        decoration: BoxDecoration(
          color: AppColors.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
