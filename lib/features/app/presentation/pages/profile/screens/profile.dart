// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecowash/features/app/presentation/pages/profile/screens/personal_info.dart';
import 'package:ecowash/features/app/presentation/pages/profile/screens/support.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/signup.dart';
import 'package:ecowash/features/auth/presentation/sm/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';

import '../../../../../../core/utils/animations/transition_animations.dart';
import '../../../../../auth/data/service/google_service.dart';
import '../widgets/image_withborder.dart';
import '../widgets/profile_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final GoogleSignInService _signInService = GoogleSignInService();
  final profileItems = [
    ProfileModel(
      title: 'Referrals',
      screen: const PersonalInfo(),
      isReferral: true,
    ),
    ProfileModel(
      title: 'Personal Information',
      screen: const PersonalInfo(),
    ),
    ProfileModel(
      title: 'Subscription Plan',
      screen: const PersonalInfo(),
    ),
    ProfileModel(
      title: 'Manage Address',
      screen: const PersonalInfo(),
    ),
    ProfileModel(
      title: 'Support',
      screen: const Support(),
    ),
    ProfileModel(
      title: 'Privacy Policy',
      screen: const PersonalInfo(),
    ),
    ProfileModel(
      title: 'Register Your Business',
      screen: const PersonalInfo(),
    ),
  ];

  void _performLogout(BuildContext context) async {
    try {
      final signOut = await _signInService.signOut();

      if (!mounted) return;
      await context.read<AuthCubit>().logout();

      if (!mounted) return;
      goTo(
        context: context,
        newScreen: const SignUp(),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                _performLogout(context);
                goTo(
                  context: context,
                  newScreen: const SignUp(),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageWithBorder(
                  imagePath: AppImages.pressingIron,
                ),
                const Hspacing(height: 20),
                Text(
                  'Aliyu Ahmed Bello',
                  style: AppTextStyles.titleSmall.copyWith(
                    color: AppColors.onSurface,
                  ),
                ),
                Text(
                  'fnathaniel929@gmail.com',
                  style: AppTextStyles.bodySmaller.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const Hspacing(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '110234',
                      style: AppTextStyles.labelLarge.copyWith(
                        color: AppColors.onPrimaryContainer,
                      ),
                    ),
                    const SvgIcon(
                      icon: AppIcons.copy,
                    )
                  ],
                ),
                const Hspacing(height: 10),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '10 Referrals',
                        style: AppTextStyles.bodySmaller.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      const Hspacing(height: 20),
                      const VerticalDivider(
                        color: AppColors.outline,
                      ),
                      Text(
                        '10 Points',
                        style: AppTextStyles.bodySmaller.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      const Hspacing(height: 20),
                      const VerticalDivider(
                        color: AppColors.outline,
                      ),
                      Text(
                        '15 Favorites',
                        style: AppTextStyles.bodySmaller.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      const Hspacing(height: 20),
                      const VerticalDivider(
                        color: AppColors.outline,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Hspacing(height: 25),
            Column(
              children: List.generate(profileItems.length, (index) {
                final model = profileItems[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      AppPageRoute(
                        page: model.screen,
                        transitionType: TransitionType.slideFromRight,
                      ),
                    );
                  },
                  child: ProfileWidget(model: model),
                );
              }),
            ),
            const Hspacing(height: 20),
            InkWell(
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
              child: Container(
                padding: AppPaddings.all10,
                decoration: BoxDecoration(
                  color: AppColors.errorContainer,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.onErrorContainer,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logout',
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.onErrorContainer,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileModel {
  final String title;
  final Widget screen;
  final bool? isReferral;
  ProfileModel({
    required this.title,
    required this.screen,
    this.isReferral,
  });
}
