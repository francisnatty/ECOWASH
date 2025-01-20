import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';

class SavedAccountWidget extends StatefulWidget {
  const SavedAccountWidget({super.key});

  @override
  State<SavedAccountWidget> createState() => _SavedAccountWidgetState();
}

class _SavedAccountWidgetState extends State<SavedAccountWidget> {
  String? _selectedAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAccountOption(
          accountName: '23XXXX32 (Access Bank)',
        ),
        //  const SizedBox(height: 20), // Spacing between options
        _buildAccountOption(
          accountName: '4XXX XXXX XXXX XX34 (Visa)',
        ),
      ],
    );
  }

  Widget _buildAccountOption({required String accountName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const SizedBox(width: 10), // Spacing between radio and text
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: accountName.split(' ')[0], // Extract account number
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.onSecondaryContainer,
                ),
              ),
              TextSpan(
                text: ' ' +
                    accountName.substring(
                        accountName.indexOf('(')), // Extract bank/card info
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.onSecondaryContainer,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Radio<String>(
          value: accountName, // Use accountName as the value
          groupValue: _selectedAccount, // Replace with your actual group value
          onChanged: (value) {
            setState(() {
              _selectedAccount = value;
            });
          },
        ),
      ],
    );
  }
}
