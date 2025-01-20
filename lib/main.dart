import 'package:device_preview/device_preview.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/features/app/presentation/pages/cart/screens/cart.dart';
import 'package:ecowash/features/app/presentation/pages/nav.dart';
import 'package:ecowash/features/auth/presentation/pages/onboarding/splash_screen.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/signup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );
// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            // color: AppColors.surface,
            //  useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              fontFamily: 'Lato',
              scaffoldBackgroundColor: AppColors.materialThemeWhite,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const HomeNav(),
          );
        });
  }
}
