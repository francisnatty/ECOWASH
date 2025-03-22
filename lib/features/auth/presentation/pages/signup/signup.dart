import 'package:ecowash/core/utils/constants/app_constants.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:ecowash/features/auth/data/requests/google_signin_payload.dart';
import 'package:ecowash/features/auth/data/service/google_service.dart';
import 'package:ecowash/features/auth/presentation/pages/login/login.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/otp_verification.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/phone_number_signin.dart';
import 'package:ecowash/features/auth/presentation/sm/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GoogleSignInService _signInService = GoogleSignInService();

  Future<void> _googleSignIn() async {
    final authProvider = Provider.of<AuthProvider>(
      context,
      listen: false,
    );

    final result = await _signInService.signIn();
    if (result.success || result.payload == null) {
      print('true');
      final payload = GoogleSigInPayload(
        googleId: result.payload!.googleId,
        email: result.payload!.email,
        role: 'USER',
      );
      DebugLogger.log('params', payload.toString());
      if (!mounted) return;
      await authProvider.googleSignIn(context: context, payload: payload);
    }
  }

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
                    onPressed: () async {
                      await _googleSignIn();
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
                  const SizedBox(height: 20),
                  AppButtons.primary(
                    onPressed: () {
                      goTo(
                        context: context,
                        newScreen: const PhoneNumberSignUp(),
                      );
                    },
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
