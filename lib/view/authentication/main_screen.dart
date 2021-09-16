import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulmate/constants/color_constant.dart';
import 'package:soulmate/view/components/material_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              const Text('SoulMate', style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600, color: textColor)),
              SizedBox(height: size.height * 0.1),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('The Only True Dating App You Need!', style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600, color: textColor), textAlign: TextAlign.center),
              ),
              const Spacer(),
              MyMaterialButton(color: primeColor, label: "With Email", onPressed: () => Get.toNamed('/emailSignUp')),
              SizedBox(height: size.height * 0.1),
            ],
          ),
        ),
      ),
    ));
  }
}
