import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/constants/app_constants.dart';

class Laundysc extends StatefulWidget {
  const Laundysc({super.key});

  @override
  State<Laundysc> createState() => _LaundyscState();
}

class _LaundyscState extends State<Laundysc> {
  final tabs = ['All', 'Services', 'Wash and Fold', 'Wash Only'];
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                    padding: EdgeInsets.only(
                      left: 2.w,
                      right: 2.w,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 2.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryContainer,
                        borderRadius: BorderRadius.circular(8),
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
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
