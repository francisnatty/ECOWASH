import 'dart:async';
import 'package:ecowash/features/auth/presentation/sm/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/wwidgets.dart';
import '../../../data/requests/reset_password_payload.dart';
import '../../widgets/design_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final bool? resetPassword;
  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
    this.resetPassword,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  Timer? _timer;
  int _timeLeft = 60; // 60 seconds countdown
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _timeLeft = 60;
      _canResend = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _canResend = true;
        });
      }
    });
  }

  void _resendOtp() {
    _startTimer();
  }

  void _resetPasswordOTP(
      {required String newPassword, required String otp}) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final payload = ResetPasswordPayload(
      newPassword: newPassword,
      confirmPassword: otp,
      token: widget.phoneNumber,
    );

    await authProvider.resetPassword(context: context, payload: payload);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                title: 'OTP Verification',
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
                        length: 6,
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
                        if (_pinController.text.length == 6) {
                          // if(widget.resetPassword!= null && widget.resetPassword==true){
                          //   _resetPasswordOTP(newPassword: newPassword, otp: otp)
                          // }
                          authProvider.verifyOtp(
                              context: context,
                              phone: widget.phoneNumber,
                              otp: _pinController.text.trim());
                        } else {}
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
                        Row(
                          children: [
                            TextButton(
                              onPressed: _canResend ? _resendOtp : null,
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(10, 10),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                'Resend',
                                style: AppTextStyles.titleMedium.copyWith(
                                  color: _canResend
                                      ? AppColors.secondary
                                      : AppColors.onBackground.withOpacity(0.5),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            if (!_canResend)
                              Text(
                                '(${_timeLeft}s)',
                                style: AppTextStyles.titleSmall.copyWith(
                                  color: AppColors.onBackground,
                                ),
                              ),
                          ],
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
