import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  final bool? resetPassword;
  const ChangePassword({
    super.key,
    this.resetPassword,
  });

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController controller = TextEditingController();
  bool _obsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.all16,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(title: 'Change Password'),
              const Hspacing(height: 30),
              Text(
                'Choose Password',
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.onSurfaceVariant),
              ),
              TextFields.passwordTextField(
                hintText: '********',
                controller: controller,
                iconPath: AppIcons.padlock,
                suffixIcon: AppIcons.eye,
                iconColor: Colors.black,
                obsecureText: _obsecurePassword,
                onVisibilityToggle: (value) {
                  setState(
                    () {
                      _obsecurePassword = value;
                    },
                  );
                },
              ),
              Text(
                'Use atleast 8 characters',
                style: AppTextStyles.bodySmaller.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const Hspacing(height: 25),
              Text(
                'Confirm Password',
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.onSurfaceVariant),
              ),
              TextFields.passwordTextField(
                hintText: '********',
                controller: controller,
                iconPath: AppIcons.padlock,
                suffixIcon: AppIcons.eye,
                iconColor: Colors.black,
                obsecureText: _obsecurePassword,
                onVisibilityToggle: (value) {
                  setState(
                    () {
                      _obsecurePassword = value;
                    },
                  );
                },
              ),
              Text(
                'Use atleast 8 characters',
                style: AppTextStyles.bodySmaller.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const Hspacing(height: 25),
              AppButtons.primary(onPressed: () {}, title: 'Change Password')
            ],
          ),
        ),
      ),
    );
  }
}
