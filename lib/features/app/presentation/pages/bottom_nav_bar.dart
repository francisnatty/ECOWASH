// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/utils.dart';

class NavBar extends StatelessWidget {
  final Function(int) onpressed;
  final int selectedIndex;
  NavBar({super.key, required this.onpressed, required this.selectedIndex});

  final List<NavBarModel> items = [
    NavBarModel(
      title: 'Home',
      icon: AppIcons.home,
    ),
    NavBarModel(
      title: 'Orders',
      icon: AppIcons.cart,
    ),
    NavBarModel(
      title: 'Product',
      icon: AppIcons.home,
    ),
    NavBarModel(
      title: 'Wallet',
      icon: AppIcons.wallet,
    ),
    NavBarModel(
      title: 'Profile',
      icon: AppIcons.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 96.h,
      padding: EdgeInsets.only(
        bottom: 10.h,
        left: 8.h,
        right: 8.h,
        top: 10.h,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          bool isActive = selectedIndex == index;
          return InkWell(
            onTap: () => onpressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: SvgPicture.asset(
                    items[index].icon,
                    height: 24.h,
                    width: 24.w,
                    colorFilter: ColorFilter.mode(
                        isActive
                            ? AppColors.primary
                            : AppColors.onSurfaceVariant,
                        BlendMode.srcIn),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  items[index].title,
                  style: AppTextStyles.bodySmallest.copyWith(
                    color: isActive
                        ? AppColors.primary
                        : AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class NavBarModel {
  final String title;
  final String icon;

  NavBarModel({
    required this.title,
    required this.icon,
  });
}
