import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulmate/controller/auth_controller.dart';
import 'package:soulmate/view/components/material_button.dart';
import 'package:soulmate/view/components/snack_bar.dart';
import 'package:soulmate/view/components/text_field.dart';

class EmailSignUp extends StatelessWidget {
  EmailSignUp({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              children: [
                SizedBox(height: size.height * 0.1),
                Text('Hi', style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600, color: Theme.of(context).primaryColor), textAlign: TextAlign.center),
                SizedBox(height: size.height * 0.1),
                MyTextField(controller: _emailController, isObsecure: false, hintText: "example@email.com", labelText: "Email"),
                SizedBox(height: size.height * 0.02),
                MyTextField(controller: _passwordController, isObsecure: true, hintText: "", labelText: "Password"),
                SizedBox(height: size.height * 0.02),
                // MyMaterialButton(label: "Continue", onPressed: () => Navigator.of(context).pushNamed('/profileImage')),
                MyMaterialButton(
                  label: "Continue",
                  onPressed: () async {
                    bool result = await Get.find<AuthController>().authenticate(_emailController.text, _passwordController.text);
                    if (result == true) {
                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar(context, "Success", 4));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar(context, "Failed", 4));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
