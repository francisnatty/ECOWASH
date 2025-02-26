import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class AroundYouWidget extends StatelessWidget {
  const AroundYouWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: const AssetImage(
                      AppImages.laundryShop,
                    ),
                  ),
                  const Hspacing(height: 10),
                  Row(
                    children: [
                      const SvgIcon(
                        icon: AppIcons.laundry,
                      ),
                      const Wspacing(width: 5),
                      Text(
                        'LAUNDRY',
                        style: AppTextStyles.labelSmaller,
                      )
                    ],
                  ),
                  const Hspacing(height: 10),
                  Text(
                    'WALEED\nWASHANIC',
                    style: AppTextStyles.labelSmaller.copyWith(
                      color: AppColors.onSurface,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
