import 'package:ecowash/core/utils/constants/colors.dart';
import 'package:ecowash/core/utils/constants/styles.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({super.key});

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Container(
        padding: AppPaddings.all10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Waleed Bello',
                  style: AppTextStyles.titleSmall.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(4.w, 4.h, 4.w, 4.h),
                  decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      const SvgIcon(icon: AppIcons.rating),
                      const Wspacing(width: 2),
                      Text(
                        '3.5',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const Hspacing(height: 10),
            Text(
              'Torem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const Hspacing(height: 5),
            Text(
              'DECEMBER 2024',
              style: AppTextStyles.labelSmaller.copyWith(
                color: AppColors.onSurface,
              ),
            )
          ],
        ),
      );
    });
  }
}
