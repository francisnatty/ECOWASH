import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class PhoneNumberField extends StatefulWidget {
  final TextEditingController controller;
  const PhoneNumberField({super.key, required this.controller});

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  String selectedCountry = '+234';
  String selectedFlag = '🇳🇬';

  final List<Map<String, String>> countries = [
    {'flag': '🇳🇬', 'code': '+234'},
    {'flag': '🇺🇸', 'code': '+1'},
    {'flag': '🇬🇧', 'code': '+44'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.outlineVariant, width: 0.75),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          // Country Dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Map<String, String>>(
                value: countries.firstWhere(
                    (country) =>
                        country['code'] == selectedCountry &&
                        country['flag'] == selectedFlag,
                    orElse: () => countries[0]),
                items: countries.map((country) {
                  return DropdownMenuItem<Map<String, String>>(
                    value: country,
                    child: Row(
                      children: [
                        Text(country['flag'] ?? ''),
                        const SizedBox(width: 5),
                        Text(country['code'] ?? ''),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCountry = value['code'] ?? '';
                      selectedFlag = value['flag'] ?? '';
                    });
                  }
                },
              ),
            ),
          ),

          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: TextInputType.phone,
              validator: phoneNumberValidator,
              decoration: const InputDecoration(
                hintText: 'Enter phone number',
                filled: true,
                fillColor: AppColors.surface,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
