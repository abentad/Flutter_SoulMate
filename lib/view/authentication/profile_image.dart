import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

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
                SizedBox(height: size.height * 0.05),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.2,
                    width: size.width * 0.3,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xffEEEEEE)),
                    child: Stack(
                      children: [
                        Center(child: Text("AB", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 35.0))),
                        Positioned(bottom: 15.0, right: 10.0, child: Icon(Icons.add, size: 32.0, color: Theme.of(context).primaryColor)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text('Add Profile Picture.', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Theme.of(context).primaryColor), textAlign: TextAlign.left),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Skip'),
                    ),
                    ElevatedButton(onPressed: () {}, child: const Text('Continue')),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
