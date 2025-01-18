// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ecowash/core/utils/constants/app_constants.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';

class DashboardSc extends StatefulWidget {
  const DashboardSc({super.key});

  @override
  State<DashboardSc> createState() => _DashboardScState();
}

class _DashboardScState extends State<DashboardSc> {
  TextEditingController searchController = TextEditingController();
  final List<DashBoardModel> items = [
    DashBoardModel(
      title: 'Laundry',
      image: AppImages.laundry,
      textColor: AppColors.onSecondaryContainer,
      bgColor: AppColors.secondaryContainer,
    ),
    DashBoardModel(
      title: 'Car Wash',
      image: AppImages.carWash,
      textColor: AppColors.onPrimaryContainer,
      bgColor: AppColors.primaryContainer,
    ),
    DashBoardModel(
      title: 'Home Cleaning',
      image: AppImages.homeCleaning,
      textColor: AppColors.onSurface,
      bgColor: AppColors.surface,
    ),
    DashBoardModel(
      title: 'Dish Washing',
      image: AppImages.dishWashing,
      textColor: AppColors.onErrorContainer,
      bgColor: AppColors.errorContainer,
    ),
    DashBoardModel(
      title: 'Commercial',
      image: AppImages.commercial,
      textColor: AppColors.onPrimaryContainer,
      bgColor: AppColors.surfaceContainer,
    ),
    DashBoardModel(
      title: 'Event',
      image: AppImages.event,
      textColor: AppColors.onSecondaryFixedVariant,
      bgColor: AppColors.secondaryFixedDim,
    ),
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemHeight = 100.h;
    final calculatedGridViewHeight = itemHeight * (items.length / 2.2).ceil();

    return Scaffold(
      backgroundColor: AppColors.materialThemeWhite,
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Location',
                        style: AppTextStyles.bodySmaller.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SvgIcon(
                    height: 32,
                    width: 32,
                    icon: AppIcons.notification,
                  ),
                ],
              ),
              const Hspacing(height: 15),
              Text(
                'Hi There.',
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.onBackground,
                ),
              ),
              const Hspacing(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFields.iconTextField(
                      hintText: 'Search here',
                      controller: searchController,
                      iconPath: AppIcons.search,
                    ),
                  ),
                  const Wspacing(width: 10),
                  const SvgIcon(
                    // height: 44.h,
                    // width: 44.h,
                    icon: AppIcons.filter,
                  )
                ],
              ),
              const Hspacing(height: 10),

              Text(
                'Services',
                style: AppTextStyles.titleSmall,
              ),
              const Hspacing(height: 15),
              SizedBox(
                height: calculatedGridViewHeight,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    // childAspectRatio: 1.0,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: itemHeight,
                      decoration: BoxDecoration(
                          color: items[index].bgColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.h,
                            width: 50.w,
                            child: Image.asset(
                              items[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Hspacing(height: 20),
                          Text(
                            items[index].title,
                            style: AppTextStyles.labelMedium.copyWith(
                              color: items[index].textColor,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // const Hspacing(height: 20),

              //  Image.asset(AppImages.containerBG),

              Container(
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
              ),
              const Hspacing(height: 15),
              Text(
                'Near you',
                style: AppTextStyles.titleSmall,
              ),

              // AppButtons.primary(
              //   onPressed: () {},
              //   title: 'HAHA',
              // ),
              // AppButtons.loading()
            ],
          ),
        ),
      ),
    );
  }
}

class DashBoardModel {
  final String title;
  final String image;
  final Color textColor;
  final Color bgColor;
  DashBoardModel({
    required this.title,
    required this.image,
    required this.textColor,
    required this.bgColor,
  });
}
