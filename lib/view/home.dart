import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulmate/constants/color_constant.dart';
import 'package:soulmate/controller/auth_controller.dart';
import 'package:soulmate/view/components/material_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.04),
                Text(Get.find<AuthController>().username.capitalize.toString(), style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: textColor)),
                const Spacer(),
                MyMaterialButton(
                  label: "Sign out",
                  onPressed: () {
                    Get.find<AuthController>().signOut();
                  },
                  color: accentColor,
                ),
                SizedBox(height: size.height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
