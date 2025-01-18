import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LaundryProfile extends StatefulWidget {
  const LaundryProfile({super.key});

  @override
  State<LaundryProfile> createState() => _LaundryProfileState();
}

class _LaundryProfileState extends State<LaundryProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const Hspacing(height: 15),
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
                          '8.00Am-09:00Pm',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.onSurface,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
