import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/app/presentation/pages/wallet/screens/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../widgets/transaction_widget.dart';
import 'topup.dart';

class WalletSc extends StatefulWidget {
  const WalletSc({super.key});

  @override
  State<WalletSc> createState() => _WalletScState();
}

class _WalletScState extends State<WalletSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.materialThemeWhite,
      body: Padding(
        padding: AppPaddings.all16,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SvgIcon(
                  icon: AppIcons.plusIcon,
                  onPressed: () {},
                ),
              ),
              const Hspacing(height: 35),
              Container(
                padding: AppPaddings.all10,
                height: 171.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.onPrimaryContainer,
                ),
                child: Column(
                  children: [
                    Text(
                      'Ecowash Wallet',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.materialThemeWhite,
                      ),
                    ),
                    const Hspacing(height: 3),
                    Text(
                      '0012334560',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.materialThemeWhite,
                      ),
                    ),
                    const Hspacing(height: 10),
                    Text(
                      'N 54,000.00',
                      style: AppTextStyles.displaySmall.copyWith(
                        color: AppColors.primaryContainer,
                      ),
                    ),
                    const Hspacing(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Show Balance',
                              style: AppTextStyles.bodySmallest.copyWith(
                                color: AppColors.materialThemeWhite,
                              ),
                            ),
                            const Wspacing(width: 5),
                            const SvgIcon(
                              icon: AppIcons.eye,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: Image.asset(
                                AppImages.weQuickPayLogo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Wspacing(width: 10),
                            Text(
                              'WeQuickPay',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.materialThemeWhite,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Hspacing(height: 15),
              Row(
                children: [
                  Expanded(
                    child: SelectionContainerWidget(
                      icon: AppIcons.history,
                      title: 'History',
                      onPressed: () {
                        goTo(
                          context: context,
                          newScreen: const TransactionHistory(),
                        );
                      },
                    ),
                  ),
                  const Wspacing(width: 10),
                  Expanded(
                    child: SelectionContainerWidget(
                      icon: AppIcons.plusIcon,
                      bgColor: AppColors.primary,
                      textColor: AppColors.materialThemeWhite,
                      title: 'Top up',
                      onPressed: () {
                        goTo(context: context, newScreen: const TopUp());
                      },
                    ),
                  ),
                ],
              ),
              const Hspacing(height: 20),
              Text(
                'Transaction History',
                style: AppTextStyles.titleSmall,
              ),
              //const Hspacing(height: 10),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return TransactionWidget(
                      isdebit: index % 2 != 0,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Hspacing(height: 2);
                  },
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionContainerWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String icon;
  final Color? bgColor;
  final Color? textColor;
  const SelectionContainerWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon,
      this.bgColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 44.h,
        padding: AppPaddings.all10,
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              icon: icon,
              iconColor: textColor ?? AppColors.onSecondaryContainer,
            ),
            Text(
              title,
              style: AppTextStyles.bodyLarge.copyWith(
                color: textColor ?? AppColors.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
