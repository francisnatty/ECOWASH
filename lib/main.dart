import 'package:device_preview/device_preview.dart';
import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/features/auth/presentation/pages/signup/signup.dart';
import 'package:ecowash/features/auth/presentation/sm/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Di.setUpLocator();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          //  home: const PhoneNumberSignin(),
          home: const SignUp(),
        );
      },
    );
  }
}
