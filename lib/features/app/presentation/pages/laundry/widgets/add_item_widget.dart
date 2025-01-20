import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class AddItemWidget extends StatelessWidget {
  const AddItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 174.w,
      padding: AppPaddings.all4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 99.h,
            width: 142.5.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                AppImages.clothes,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Hspacing(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'T-Shirt',
                    style: AppTextStyles.titleSmall,
                  ),
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
                        style: AppTextStyles.labelLarge.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' Per Pcs',
                        style: AppTextStyles.bodySmaller.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: const SvgIcon(
                  icon: AppIcons.addIcon,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
