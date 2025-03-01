import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/auth/presentation/sm/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/utils.dart';
import '../../../data/requests/phone_signin_payload.dart';
import '../../widgets/design_widget.dart';
import '../../widgets/phone_num_textfield.dart';

class PhoneNumberSignin extends StatefulWidget {
  const PhoneNumberSignin({super.key});

  @override
  State<PhoneNumberSignin> createState() => _PhoneNumberSigninState();
}

class _PhoneNumberSigninState extends State<PhoneNumberSignin> {
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    phonecontroller.dispose();
    passwordController.dispose();
    super.dispose();
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
                      PhoneNumberField(
                        controller: phonecontroller,
                      ),
                      const Hspacing(height: 20),
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
                        validator: notEmptyValidator,
                        iconColor: Colors.black,
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
                      const Hspacing(height: 20),
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
      ),
    );
  }
}
