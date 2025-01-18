import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class DashboardDiscountWidget extends StatelessWidget {
  const DashboardDiscountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: AssetImage(
            AppImages.containerBG,
          ), // Your image path here
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Overlay Color
          Container(
            //   padding: AppPaddings.all10,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // Texts and Button
          Padding(
            padding: AppPaddings.all10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('QT-Laundry Services',
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.materialThemeWhite,
                    )),
                const Hspacing(height: 5),
                Row(
                  children: [
                    Text('35%',
                        style: AppTextStyles.headlineLarge.copyWith(
                          color: AppColors.primaryContainer,
                        )),
                    Text(
                      'OFF',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primaryContainer,
                      ),
                    ),
                  ],
                ),
                Text(
                  'On your first order',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.primaryContainer,
                  ),
                ),
                const Hspacing(height: 8),
                AppButtons.primary(
                  height: 32.h,
                  width: 151.w,
                  onPressed: () {},
                  title: 'Claim',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
