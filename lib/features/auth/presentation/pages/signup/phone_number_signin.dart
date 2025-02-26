import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/auth/data/requests/phone_signin_payload.dart';
import 'package:ecowash/features/auth/presentation/sm/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/utils.dart';

class PhoneNumberSignin extends StatefulWidget {
  const PhoneNumberSignin({super.key});

  @override
  State<PhoneNumberSignin> createState() => _PhoneNumberSigninState();
}

class _PhoneNumberSigninState extends State<PhoneNumberSignin> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DesignWidget(
                title: 'Create Account',
                description:
                    'Fill your information below or register\nwith your social accounts.',
              ),
              const Hspacing(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    const PhoneNumberField(),
                    const Hspacing(height: 20),
                    Text(
                      'Create Password',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    TextFields.passwordTextField(
                        hintText: '*******',
                        controller: controller,
                        iconPath: AppIcons.padlock,
                        suffixIcon: AppIcons.eye,
                        iconColor: Colors.black),
                    Text(
                      'Use atleast 8 characters',
                      style: AppTextStyles.bodySmaller.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    const Hspacing(height: 20),
                    Row(
                      children: [
                        Text(
                          'Agree to Terms and Conditions',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.onBackground,
                          ),
                        )
                      ],
                    ),
                    const Hspacing(height: 20),
                    AppButtons.primary(
                      onPressed: () {
                        final payload = PhoneSignInPayload(
                          phone: '+2349022901746',
                          password: '12345678',
                          role: 'USER',
                        );
                        authProvider.phoneSignIn(
                            context: context, payload: payload);
                        // final spinkit = SpinKitFadingCircle(
                        //   itemBuilder: (BuildContext context, int index) {
                        //     return DecoratedBox(
                        //       decoration: BoxDecoration(
                        //         color: index.isEven ? Colors.red : Colors.green,
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                      title: 'Create account',
                    ),
                    const Hspacing(height: 45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: AppTextStyles.titleSmall.copyWith(
                            color: AppColors.onBackground,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Login',
                          style: AppTextStyles.titleMedium.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DesignWidget extends StatelessWidget {
  final String title;
  final String description;
  const DesignWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            AppImages.onbBg,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({super.key});

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
          // Vertical Divider
          // Container(
          //   width: 1.0,
          //   height: 40.0,
          //   color: Colors.grey,
          // ),
          // // Phone Number Input Field
          Expanded(
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter phone number',
                filled: true,
                fillColor: AppColors.surface,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
