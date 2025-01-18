import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/features/app/presentation/pages/dashboard/widgets/discount_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../core/widgets/wwidgets.dart';
import '../widgets/around_you_widget.dart';
import '../widgets/for_you_widget.dart';

class LaundryScreen extends StatefulWidget {
  const LaundryScreen({super.key});

  @override
  State<LaundryScreen> createState() => _LaundryScreenState();
}

class _LaundryScreenState extends State<LaundryScreen> {
  TextEditingController searchController = TextEditingController();
  final tabs = ['All', 'Services', 'Wash and Fold', 'Wash Only'];
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Leading icon aligned to the start
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgIcon(
                      icon: AppIcons.backIcon,
                      onPressed: () {
                        popWidget(context: context);
                      },
                    ),
                  ),
                  // Centered title
                  Text(
                    'Laundry Services',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.onBackground,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Hspacing(height: 20),
              TextFields.iconTextField(
                hintText: 'Search here',
                controller: searchController,
                iconPath: AppIcons.search,
              ),
              const Hspacing(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(tabs.length, (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        tabIndex = index;
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
                              color: tabIndex == index
                                  ? AppColors.onSecondaryContainer
                                  : Colors.transparent,
                            )),
                        child: Center(
                          child: Text(
                            tabs[index],
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
              const Hspacing(height: 20),
              Text(
                'Around you',
                style: AppTextStyles.titleSmall,
              ),
              const AroundYouWidget(),
              const DashboardDiscountWidget(),
              const Hspacing(height: 20),
              Text(
                'For You',
                style: AppTextStyles.titleSmall,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 400.h,
                ),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ForYouWidget();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
