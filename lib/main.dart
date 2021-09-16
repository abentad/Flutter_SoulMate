import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soulmate/controller/auth_controller.dart';
import 'package:soulmate/view/authentication/email_signup.dart';
import 'package:soulmate/view/authentication/main_screen.dart';
import 'package:soulmate/view/authentication/profile_image.dart';
import 'package:soulmate/view/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  Get.put<AuthController>(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.config(
      defaultPopGesture: true,
      defaultTransition: Transition.fade,
    );
    return GetMaterialApp(
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
      title: 'Soulmate',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/emailSignUp': (context) => const EmailSignUp(),
        '/home': (context) => const Home(),
        '/profileImage': (context) => const ProfileImage(),
      },
    );
  }
}
