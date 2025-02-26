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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Bottom Navigation Bar
        Container(
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
              // Check if the current index is 2 (to replace with the floating container)
              if (index == 2) {
                return SizedBox(
                    width: 60.w); // Reserve space for the floating container
              }
              // Normal tabs
              bool isActive = selectedIndex == index;
              return InkWell(
                onTap: () => onpressed(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      items[index].icon,
                      height: 24.h,
                      width: 24.w,
                      colorFilter: ColorFilter.mode(
                        isActive
                            ? AppColors.primary
                            : AppColors.onSurfaceVariant,
                        BlendMode.srcIn,
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
        ),

        Positioned(
          top: -30.h,
          left: MediaQuery.of(context).size.width / 2 - 30.w,
          child: GestureDetector(
            onTap: () => onpressed(2),
            child: Container(
              height: 60.h,
              width: 60.h,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30.h,
              ),
            ),
          ),
        ),
      ],
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
