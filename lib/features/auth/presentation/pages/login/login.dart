import 'package:ecowash/features/app/presentation/pages/nav.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/wwidgets.dart';
import '../../widgets/design_widget.dart';
import '../../widgets/phone_num_textfield.dart';
import '../signup/forgot_password.dart';
import '../signup/phone_number_signin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            children: [
              const DesignWidget(
                title: 'Welcome back!',
                description: 'Hi welcome back,you have been missed.',
              ),
              const Hspacing(height: 20),
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
                    PhoneNumberField(
                      controller: controller,
                    ),
                    const Hspacing(height: 15),
                    Text(
                      'Phone Number',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    TextFields.passwordTextField(
                      hintText: '*******',
                      controller: controller,
                      iconPath: AppIcons.padlock,
                      suffixIcon: AppIcons.eye,
                      fill: true,
                      fillColor: AppColors.surface,
                    ),
                    const Hspacing(height: 7),
                    InkWell(
                      onTap: () {
                        goTo(
                            context: context,
                            newScreen: const ForgotPassword());
                      },
                      child: Text(
                        'Forgot Password',
                        style: AppTextStyles.labelMedium.copyWith(
                          color: AppColors.onBackground,
                        ),
                      ),
                    ),
                    const Hspacing(height: 15),
                    AppButtons.primary(
                      onPressed: () {
                        goToAndRemove(
                            context: context, newScreen: const HomeNav());
                      },
                      title: 'Login',
                    ),
                  ],
                ),
              ),
              const Hspacing(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: AppTextStyles.titleSmall.copyWith(
                      color: AppColors.onBackground,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Create Account',
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
