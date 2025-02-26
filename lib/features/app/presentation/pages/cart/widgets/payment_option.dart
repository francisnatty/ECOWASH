import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/app_constants.dart';

class PaymentOptionColumn extends StatefulWidget {
  const PaymentOptionColumn({super.key});

  @override
  _PaymentOptionColumnState createState() => _PaymentOptionColumnState();
}

class _PaymentOptionColumnState extends State<PaymentOptionColumn> {
  int _selectedOptionIndex = 0; // Default to first option

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              _buildOption(
                'Wallet Payment',
                subText: 'wallet Balance: N500',
                hasRadio: false,
              ),
              _buildOption('Pay with Card'),
              _buildOption('Online payment'),
              _buildOption('Payment on delivery'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildOption(String text, {String? subText, bool hasRadio = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.onPrimaryContainer,
              ),
            ),
            if (subText != null)
              Text(
                subText,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.onPrimaryContainer,
                ),
              ),
          ],
        ),
        Radio(
          value: _options.indexOf(text),
          groupValue: _selectedOptionIndex,
          onChanged: (int? value) {
            setState(() {
              _selectedOptionIndex = value!;
            });
          },
        ),
      ],
    );
  }

  final List<String> _options = [
    'Wallet Payment',
    'Pay with Card',
    'Online payment',
    'Payment on delivery',
  ];
}
