import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';

class TransactionWidget extends StatelessWidget {
  final bool isdebit;
  const TransactionWidget({
    super.key,
    required this.isdebit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.all10,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Receipt',
                  style: AppTextStyles.titleSmall.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                const Hspacing(height: 7),
                Text(
                  'Order 1234ft56',
                  style: AppTextStyles.labelLarge.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const Hspacing(height: 7),
                Text(
                  isdebit ? 'Debited' : 'Successful',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isdebit ? AppColors.error : AppColors.primary,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '+ N 500.00',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: isdebit ? AppColors.error : AppColors.primary,
                  ),
                ),
                Text(
                  '2 minutes ago',
                  style: AppTextStyles.bodySmaller.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
