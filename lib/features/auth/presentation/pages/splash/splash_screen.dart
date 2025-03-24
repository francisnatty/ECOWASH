import 'package:ecowash/core/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(
                height: 300.h,
                width: 300.w,
                AppImages.splashLogo,
                // fit: BoxFit.contain,
              ),
            ),
            // const Spacer(),
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: const SvgIcon(
                icon: AppIcons.splashDesign,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ));
  }
}
