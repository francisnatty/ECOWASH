import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/app/presentation/pages/cart/screens/tab/active_tab.dart';
import 'package:ecowash/features/app/presentation/pages/cart/screens/tab/cart_tab.dart';
import 'package:ecowash/features/app/presentation/pages/cart/screens/tab/completed_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> tabs = ['Cart', 'Active', 'Completed'];
  List<Widget> screens = [
    const CartTab(),
    const ActiveTab(),
    const CompletedTab(),
  ];
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AppButtons.iconButton(
                  width: 110.w,
                  onPressed: () {},
                  title: 'Add More',
                  icon: AppIcons.plusIcon,
                  bgColor: AppColors.surface,
                  textColor: AppColors.onSecondaryContainer,
                ),
              ),
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
                            0.w,
                            4.w,
                            0.w,
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
              const Hspacing(height: 20),
              Expanded(
                child: screens[tabIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
