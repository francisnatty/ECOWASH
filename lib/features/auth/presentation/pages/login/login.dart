import 'package:ecowash/features/app/presentation/pages/nav.dart';
import 'package:ecowash/features/auth/data/requests/login_payload.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/phone_number_signup.dart';
import 'package:ecowash/features/auth/presentation/sm/auth_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/wwidgets.dart';
import '../../widgets/design_widget.dart';
import '../../widgets/phone_num_textfield.dart';
import '../signup/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obsecurePassword = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                        'Password',
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
                        fill: true,
                        fillColor: AppColors.surface,
                        iconColor: Colors.black,
                        onVisibilityToggle: (value) {
                          setState(
                            () {
                              _obsecurePassword = value;
                            },
                          );
                        },
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            print(controller.text.trim());
                            print(passwordController.text.trim());
                            final payload = LoginPayload(
                              phone: controller.text
                                  .trim()
                                  .replaceFirst('0', '+234'),
                              password: passwordController.text.trim(),
                            );

                            await authProvider.login(
                                context: context, payload: payload);
                          } else {
                            print('no data');
                          }

                          // goToAndRemove(
                          //     context: context, newScreen: const HomeNav());
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
                    InkWell(
                      onTap: () {
                        goTo(
                          context: context,
                          newScreen: const PhoneNumberSignUp(),
                        );
                      },
                      child: Text(
                        'Create Account',
                        style: AppTextStyles.titleMedium.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
