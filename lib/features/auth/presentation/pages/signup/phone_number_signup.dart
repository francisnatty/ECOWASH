import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/auth/data/requests/apple_signin_payload.dart';
import 'package:ecowash/features/auth/presentation/pages/login/login.dart';
import 'package:ecowash/features/auth/presentation/sm/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/utils.dart';
import '../../../data/requests/google_signin_payload.dart';
import '../../../data/requests/phone_signin_payload.dart';
import '../../../data/service/apple_service.dart';
import '../../../data/service/google_service.dart';
import '../../widgets/design_widget.dart';
import '../../widgets/phone_num_textfield.dart';

class PhoneNumberSignUp extends StatefulWidget {
  const PhoneNumberSignUp({super.key});

  @override
  State<PhoneNumberSignUp> createState() => _PhoneNumberSignUpState();
}

class _PhoneNumberSignUpState extends State<PhoneNumberSignUp> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GoogleSignInService _signInService = GoogleSignInService();
  final AppleSignInService _appleSignInService = AppleSignInService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _obsecurePassword = true;
  @override
  void dispose() {
    phonecontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _googleSignUp() async {
    final authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    final result = await _signInService.signUp();
    if (result.success || result.payload == null) {
      final payload = GoogleSigInPayload(
        googleId: result.payload!.googleId,
        email: result.payload!.email,
        role: 'USER',
      );
      DebugLogger.log('params', payload.toString());
      if (!mounted) return;
      await authProvider.googleSignUp(context: context, payload: payload);
    }
  }

  Future<void> _appleSignUp() async {
    final authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    final result = await _appleSignInService.signUp();
    if (result.success || result.payload == null) {
      final payload = AppleSignInPayload(
        appleId: result.payload!.appleId,
        email: result.payload!.email,
        role: 'USER',
      );
      DebugLogger.log('params', payload.toString());
      if (!mounted) return;
      await authProvider.appleSignUp(context: context, payload: payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
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
                //  const Hspacing(height: 10),
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
                        controller: phonecontroller,
                      ),
                      const Hspacing(height: 15),
                      Text(
                        'Create Password',
                        style: AppTextStyles.labelLarge.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      TextFields.passwordTextField(
                        hintText: '*******',
                        controller: passwordController,
                        iconPath: AppIcons.padlock,
                        suffixIcon: AppIcons.eye,
                        obsecureText: _obsecurePassword,
                        validator: notEmptyValidator,
                        iconColor: Colors.black,
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
                      const Hspacing(height: 10),
                      AppButtons.primary(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final payload = PhoneSignInPayload(
                              phone: phonecontroller.text
                                  .trim()
                                  .replaceFirst('0', '+234'),
                              password: passwordController.text.trim(),
                              role: 'USER',
                            );
                            DebugLogger.log(
                                'phone signin payload', payload.toString());

                            await authProvider.phoneSignIn(
                                context: context, payload: payload);
                          }
                        },
                        title: 'Create account',
                      ),
                      const Hspacing(height: 30),
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
                          InkWell(
                            onTap: () {
                              goTo(
                                context: context,
                                newScreen: const LoginScreen(),
                              );
                            },
                            child: Text(
                              'Login',
                              style: AppTextStyles.titleMedium.copyWith(
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Hspacing(height: 10),
                      AppButtons.iconButton(
                        onPressed: () async {
                          await _googleSignUp();
                          //  await _googleSignIn();
                        },
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
