import 'package:ecowash/core/utils/constants/app_texts.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/app/presentation/pages/laundry/widgets/reviews_tab.dart';
import 'package:ecowash/features/app/presentation/pages/laundry/widgets/service_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/product_tab.dart';

class LaundryProfile extends StatefulWidget {
  const LaundryProfile({super.key});

  @override
  State<LaundryProfile> createState() => _LaundryProfileState();
}

class _LaundryProfileState extends State<LaundryProfile> {
  List<String> services = ['All', 'Wash and Fold', 'Wash Only', 'Iron only'];
  int serviceIndex = 0;
  int tabIndex = 0;
  List<String> tabs = [
    'Services',
    'Product',
    'Reviews',
  ];

  List<Widget> tabScreens = [
    const ServiceTab(),
    const ProductTab(),
    const ReviewsTab(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SvgIcon(icon: AppIcons.backIcon),
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
                  const Row(
                    children: [
                      SvgIcon(
                        icon: AppIcons.favourite,
                      ),
                      Wspacing(width: 30),
                      SvgIcon(
                        icon: AppIcons.cartBag,
                      )
                    ],
                  )
                ],
              ),
              const Hspacing(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SvgIcon(
                        icon: AppIcons.location,
                      ),
                      //  const Wspacing(width: 10),
                      Text(
                        'Malali,Kaduna Nigeria',
                        style: AppTextStyles.labelSmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      )
                    ],
                  ),
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
                ],
              ),
              const Hspacing(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Business Hours',
                    style: AppTextStyles.bodySmaller.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  Container(
                    padding: AppPaddings.all4,
                    decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        const SvgIcon(
                          icon: AppIcons.clock,
                        ),
                        Text(
                          ' 8.00AM-09:00PM',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.onSurface,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Hspacing(height: 15),
              Text(
                'About Us',
                style: AppTextStyles.labelLarge.copyWith(
                  color: AppColors.onPrimaryContainer,
                ),
              ),
              const Hspacing(height: 10),
              Text(
                AppTexts.dummyDescription,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const Hspacing(height: 10),
              // AppButtons.primary(
              //   bgColor: AppColors.surfaceContainer,
              //   textStyle: AppTextStyles.titleMedium.copyWith(
              //     color: AppColors.outline,
              //   ),
              //   onPressed: () {},
              //   title: 'Enjoy Subscription',
              // ),
              AppButtons.primary(
                bgColor: AppColors.primary,
                // textStyle: AppTextStyles.titleMedium.copyWith(
                //   color: AppColors.outline,
                // ),
                onPressed: () {},
                title: 'Enjoy Subscription',
              ),
              const Hspacing(
                height: 20,
              ),
              Text(
                'Our Services',
                style: AppTextStyles.titleSmall,
              ),
              const Hspacing(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(services.length, (index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          serviceIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 2.w,
                          right: 2.w,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 7.h,
                            horizontal: 15.w,
                          ),
                          decoration: BoxDecoration(
                              color: AppColors.secondaryContainer,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: serviceIndex == index
                                    ? AppColors.onSecondaryContainer
                                    : Colors.transparent,
                              )),
                          child: Center(
                            child: Text(
                              services[index],
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.onSurface,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const Hspacing(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          tabIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(
                            5.w,
                            4.w,
                            5.w,
                            4.w,
                          ),
                          decoration: BoxDecoration(
                              color: tabIndex == index
                                  ? AppColors.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: AppTextStyles.labelLarge.copyWith(
                                color: tabIndex == index
                                    ? AppColors.materialThemeWhite
                                    : AppColors.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Expanded(child: tabScreens[tabIndex]),
            ],
          ),
        ),
      ),
    );
  }
}
