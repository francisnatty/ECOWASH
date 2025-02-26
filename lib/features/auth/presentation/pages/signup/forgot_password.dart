import 'package:ecowash/features/auth/presentation/pages/signup/password_verification.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/wwidgets.dart';
import 'phone_number_signin.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DesignWidget(
                title: 'Forgot Password',
                description:
                    ' Provide us with the Phone number\nyou registered your account with to\nverify and send you an OTP to access\nyour account.',
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
                    AppButtons.primary(
                      onPressed: () {
                        goTo(
                          context: context,
                          newScreen: const PasswordVerification(),
                        );
                      },
                      title: 'Send OTP',
                    ),
                    const Hspacing(height: 45),
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
