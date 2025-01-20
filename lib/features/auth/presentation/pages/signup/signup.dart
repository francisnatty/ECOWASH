import 'package:ecowash/core/utils/constants/app_constants.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: SvgIcon(icon: AppIcons.testHeader),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: SvgIcon(icon: AppIcons.testFooter),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: Image.asset(
                        AppImages.ecowashLogo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Get Started',
                    style: AppTextStyles.headlineLarge,
                  ),
                  const SizedBox(height: 30),
                  AppButtons.iconButton(
                    onPressed: () {},
                    title: 'Continue with Google',
                    icon: AppIcons.gogle,
                    bgColor: AppColors.surfaceContainer,
                    textColor: AppColors.onSecondaryContainer,
                  ),
                  const SizedBox(height: 20),
                  AppButtons.iconButton(
                    onPressed: () {},
                    title: 'Continue with Apple',
                    icon: AppIcons.apple,
                    bgColor: AppColors.surfaceContainer,
                    textColor: AppColors.onSecondaryContainer,
                  ),
                  const SizedBox(height: 20),
                  AppButtons.primary(
                    onPressed: () {},
                    title: 'Login to account',
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Create Account',
                        style: AppTextStyles.bodyLarge.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 100), // Spacing to avoid overlap with the footer
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
