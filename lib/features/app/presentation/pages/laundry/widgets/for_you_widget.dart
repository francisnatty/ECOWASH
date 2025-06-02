import 'package:ecowash/features/app/presentation/pages/laundry/screens/laundry_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            height: 71.h,
            width: 93.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                AppImages.clothes,
              ),
            ),
          ),
          const Wspacing(width: 5),
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'A Wanke A Goge',
                      style: AppTextStyles.titleSmall.copyWith(
                        color: AppColors.onSurface,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.secondaryContainer,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'WASH AND IRON',
                        style: AppTextStyles.labelSmaller.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  'Waleed Washanic',
                  style: AppTextStyles.bodySmaller.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                const Hspacing(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '\$2,500 ',
                          style: AppTextStyles.labelLarge.copyWith(
                            color: AppColors.onSurface,
                          ),
                        ),
                        Text(
                          'Per Set',
                          style: AppTextStyles.bodySmaller.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 28.h,
                      width: 99.w,
                      child: AppButtons.primary(
                        onPressed: () {
                          goTo(
                            context: context,
                            newScreen: const LaundryProfile(),
                          );
                        },
                        title: 'Book Now',
                      ),
                    )
                  ],
                )
              ],
            ),
          )
       
       
       
        ],
      ),
    );
  }
}
