import 'package:ecowash/features/app/presentation/pages/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/wwidgets.dart';
import '../../widgets/design_widget.dart';
import '../login/login.dart';
import 'phone_number_signup.dart';

class PasswordVerification extends StatefulWidget {
  const PasswordVerification({super.key});

  @override
  State<PasswordVerification> createState() => _PasswordVerificationState();
}

class _PasswordVerificationState extends State<PasswordVerification> {
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const DesignWidget(
                title: 'Password Verification',
                description: 'Provide the OTP sent to your phone',
              ),
              const Hspacing(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 7,
                        controller: _pinController,
                        obscureText: true,
                        obscuringWidget: const Text('*'),
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(12),
                          fieldHeight: 44.h,
                          fieldWidth: 38.w,
                          // activeFillColor: AppColors.onBackground,
                          // selectedFillColor: AppColors.onBackground,
                          inactiveFillColor: AppColors.surfaceContainer,
                          activeColor: AppColors.outlineVariant,
                          selectedColor: AppColors.outlineVariant,
                          inactiveColor: Colors.grey,
                          borderWidth: 1,
                          activeBorderWidth: 1,
                          inactiveBorderWidth: 1,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        onCompleted: (v) {},
                        onChanged: (value) {
                          // Handle code change
                        },
                      ),
                    ),
                    const Hspacing(height: 20),
                    AppButtons.primary(
                      onPressed: () {
                        goToAndRemove(
                          context: context,
                          newScreen: const HomeNav(),
                        );
                      },
                      title: 'Verify',
                    ),
                    const Hspacing(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Haven\'t received OTP yet?',
                          style: AppTextStyles.titleSmall.copyWith(
                            color: AppColors.onBackground,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Resend',
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
