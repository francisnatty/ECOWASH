import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/features/app/presentation/pages/dashboard/widgets/discount_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: CustomScrollView(
        slivers: [
          // App Bar
          SliverAppBar(
            floating: true,
            leadingWidth: 40,
            backgroundColor: AppColors.surface,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: SvgIcon(
                icon: AppIcons.backIcon,
                onPressed: () => popWidget(context: context),
              ),
            ),
            title: Text(
              'Laundry Services',
              style: AppTextStyles.titleMedium.copyWith(
                color: AppColors.onBackground,
              ),
            ),
            centerTitle: true,
          ),

          // Search and Tabs Section
          SliverPadding(
            padding: AppPaddings.all16,
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFields.iconTextField(
                    hintText: 'Search here',
                    controller: searchController,
                    iconPath: AppIcons.search,
                  ),
                  const Hspacing(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(tabs.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              tabIndex = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                                ),
                              ),
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
                  ),
                ],
              ),
            ),
          ),

          // Around You Section
          SliverPadding(
            padding: AppPaddings.all16,
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Around you',
                    style: AppTextStyles.titleSmall,
                  ),
                  const AroundYouWidget(),
                  const DashboardDiscountWidget(),
                ],
              ),
            ),
          ),
          // Hspacing(height: 10),

          // For You Section Header
          SliverPadding(
            padding: AppPaddings.horizontal16.copyWith(
              top: 20,
              left: 16.w,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                'For You',
                style: AppTextStyles.titleSmall,
              ),
            ),
          ),

          // For You List
          SliverPadding(
            padding: AppPaddings.all16,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const ForYouWidget(),
                childCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
