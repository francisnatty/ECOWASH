import 'package:ecowash/core/utils/constants/app_constants.dart';
import 'package:ecowash/core/utils/constants/res.dart';
import 'package:ecowash/core/utils/constants/paddings.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/material.dart';

class DashboardSc extends StatefulWidget {
  const DashboardSc({super.key});

  @override
  State<DashboardSc> createState() => _DashboardScState();
}

class _DashboardScState extends State<DashboardSc> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
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
              TextFields.iconTextField(
                hintText: 'Search here',
                controller: searchController,
                iconPath: AppIcons.search,
              ),
              const Hspacing(height: 25),

              Text(
                'Services',
                style: AppTextStyles.titleSmall,
              ),

              AppButtons.primary(
                onPressed: () {},
                title: 'HAHA',
              ),
              // AppButtons.loading()
            ],
          ),
        ),
      ),
    );
  }
}
