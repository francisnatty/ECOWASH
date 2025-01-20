import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';
import '../widgets/transaction_widget.dart';

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.materialThemeWhite,
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.all16,
          child: Column(
            children: [
              Row(
                children: [
                  SvgIcon(
                    icon: AppIcons.backIcon,
                    onPressed: () {
                      popWidget(context: context);
                    },
                  ),
                  const Wspacing(width: 20),
                  Text(
                    'Transaction History',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                ],
              ),
              const Hspacing(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextFields.iconTextField(
                      hintText: 'Search here',
                      controller: searchController,
                      iconPath: AppIcons.search,
                    ),
                  ),
                  const Wspacing(width: 5),
                  SvgIcon(
                    height: 50.h,
                    width: 50.h,
                    icon: AppIcons.filter,
                  )
                ],
              ),
              const Hspacing(height: 20),
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
                  itemCount: 20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
