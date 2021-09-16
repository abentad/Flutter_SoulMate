import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulmate/controller/auth_controller.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  bool _isUserAvailable = false;

  @override
  void initState() {
    super.initState();
    checkUserAvailability();
  }

  void checkUserAvailability() async {
    _isUserAvailable = await Get.find<AuthController>().checkUserExistence();
    _isUserAvailable ? Get.offAllNamed('/home') : Get.offAllNamed('/emailSignUp');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
