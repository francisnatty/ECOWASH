import 'package:ecowash/features/app/presentation/pages/profile/screens/change_password.dart';
import 'package:ecowash/features/app/presentation/pages/profile/widgets/image_withborder.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/phone_number_signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../core/widgets/wwidgets.dart';
import '../../../../../auth/presentation/widgets/phone_num_textfield.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: 'Personal Information',
              ),
              const Hspacing(height: 30),
              Column(
                children: [
                  const ImageWithBorder(
                    imagePath: AppImages.pressingIron,
                  ),
                  const Hspacing(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Upload new profile',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                      const Wspacing(width: 5),
                      const SvgIcon(icon: AppIcons.upload)
                    ],
                  )
                ],
              ),
              const Hspacing(height: 25),
              Text(
                'Full Name',
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.onSurfaceVariant),
              ),
              TextFields.iconTextField(
                hintText: 'Aliyu Ahmed Bello',
                controller: controller,
                iconPath: AppIcons.profile,
                iconColor: AppColors.onSurface,
              ),
              const Hspacing(height: 20),
              Text(
                'Phone Number',
                style: AppTextStyles.labelLarge
                    .copyWith(color: AppColors.onSurfaceVariant),
              ),
              PhoneNumberField(
                controller: controller,
              ),
              const Hspacing(height: 30),
              AppButtons.primary(
                onPressed: () {},
                title: 'Save Changes',
              ),
              const Hspacing(height: 20),
              AppButtons.primary(
                bgColor: AppColors.secondaryContainer,
                textColor: AppColors.onSecondaryContainer,
                onPressed: () {
                  goTo(context: context, newScreen: const ChangePassword());
                },
                title: 'Change Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
