import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soulmate/constants/color_constant.dart';
import 'package:soulmate/controller/auth_controller.dart';
import 'package:soulmate/view/components/material_button.dart';
import 'package:soulmate/view/components/snack_bar.dart';
import 'package:soulmate/view/components/text_field.dart';

class EmailSignUp extends StatefulWidget {
  const EmailSignUp({Key? key}) : super(key: key);

  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordObsecure = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                const Text('Sign in', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w600, color: accentColor), textAlign: TextAlign.center),
                SizedBox(height: size.height * 0.05),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [BoxShadow(color: Colors.blueGrey, offset: Offset(2, 7), blurRadius: 10.0)],
                  ),
                  child: Column(
                    children: [
                      // SizedBox(height: size.height * 0.1),
                      SizedBox(height: size.height * 0.02),
                      MyTextField(
                          controller: _emailController,
                          hasSuffix: false,
                          isObsecure: false,
                          hintText: "example@email.com",
                          labelText: "Email",
                          prefixIcon: Icons.mail,
                          suffixOnPressed: () {}),
                      SizedBox(height: size.height * 0.02),
                      MyTextField(
                        controller: _passwordController,
                        isObsecure: _isPasswordObsecure,
                        hasSuffix: true,
                        hintText: "",
                        labelText: "Password",
                        prefixIcon: Icons.lock,
                        suffixOnPressed: () {
                          setState(() {
                            _isPasswordObsecure = !_isPasswordObsecure;
                          });
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                MyMaterialButton(
                  label: "Continue",
                  color: accentColor,
                  onPressed: () async {
                    if (_emailController.text != "" && _passwordController.text != "") {
                      bool result = await Get.find<AuthController>().authenticate(_emailController.text, _passwordController.text);
                      if (result == true) {
                        ScaffoldMessenger.of(context).showSnackBar(myFloatingSnackBar(context, "Success", 4, successColor));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(myFloatingSnackBar(context, "Failed", 4, failColor));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(myFloatingSnackBar(context, "Empty Field", 4, failColor));
                    }
                  },
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot my password',
                    style: TextStyle(
                      color: accentColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
