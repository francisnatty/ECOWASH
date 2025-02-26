import 'package:ecowash/core/utils/constants/app_texts.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../widgets/add_item_widget.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 295.h,
                width: double.infinity,
                child: Image.asset(
                  AppImages.pressingIron,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Hspacing(height: kToolbarHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgIcon(
                              icon: AppIcons.backIcon,
                              iconColor: AppColors.materialThemeWhite,
                              onPressed: () {
                                popWidget(context: context);
                              },
                            ),
                            const Wspacing(width: 20),
                            Text(
                              'Details',
                              style: AppTextStyles.titleMedium.copyWith(
                                color: AppColors.materialThemeWhite,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            color: AppColors.materialThemeWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const SvgIcon(icon: AppIcons.favourite),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Hspacing(height: 20),
          Expanded(
            child: Padding(
              padding: AppPaddings.all16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        height: 24.h,
                        width: 24.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: AppColors.primary,
                            width: 0.75,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            AppImages.clothes,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Wspacing(width: 5),
                      Text(
                        'Waleed Washanic',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'PurSteam',
                    style: AppTextStyles.titleInbetween.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  const Hspacing(height: 7),
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
                        style: AppTextStyles.titleSmall.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' Per Unit',
                        style: AppTextStyles.bodySmaller.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const Hspacing(height: 7),
                  Row(
                    children: [
                      const SvgIcon(
                        icon: AppIcons.rating,
                      ),
                      const Hspacing(height: 10),
                      Text(
                        '4.5 (405 Reviews)',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      )
                    ],
                  ),
                  const Hspacing(height: 25),
                  Text(
                    'Decription',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Hspacing(height: 10),
                  Text(
                    AppTexts.dummyDescription,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const Hspacing(height: 20),
                  Text(
                    'Featured',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: AppColors.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.all(0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 items per row
                            crossAxisSpacing: 10,
                            // mainAxisSpacing: 10,
                          ),
                          itemCount: 10, // Replace with your actual item count
                          itemBuilder: (context, index) {
                            return const AddItemWidget();
                          })),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.surfaceContainerLow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                AppButtons.primary(
                  width: 103.w,
                  height: 44.h,
                  onPressed: () {},
                  title: 'Checkout',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
