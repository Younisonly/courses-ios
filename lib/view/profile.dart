import 'package:courses/view/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../view_model/screens_view_model.dart';
import '../widgets/constants.dart';
import '../widgets/custom_text.dart';
import 'login_screen.dart';

class profile extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScreenViewModel>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("User Profile")),
            backgroundColor: primaryColor,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 50, top: 30, right: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 20),
                      child: CustomText(
                        text:
                            "Welcome ${controller.UserInfo['name'].toString()}!",
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: "Your Email:  ",
                      fontSize: 19,
                    ),
                    CustomText(
                      text: "${controller.UserInfo['email'].toString()}",
                      fontSize: 19,
                      color: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    const CustomText(
                      text: "Your Type:  ",
                      fontSize: 19,
                    ),
                    CustomText(
                      text: "${controller.Type.toString()}",
                      fontSize: 19,
                      color: primaryColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                const CustomText(
                  text: "Your phone number is:  ",
                  fontSize: 19,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomText(
                  text: "${controller.UserInfo['number'].toString()}",
                  fontSize: 19,
                  color: primaryColor,
                ),
                const SizedBox(
                  height: 45,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0)),
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3, right: 0, left: 15, bottom: 3),
                    child: Row(
                      children: const [
                        Icon(Icons.logout),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Log In With Another Account",
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    _auth.signOut();
                    Get.offAll((LoginScreen()));
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0)),
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ), child: Padding(
                    padding: const EdgeInsets.only(
                        top: 3, right: 0, left: 45, bottom: 3),
                    child: Row(
                      children: const [
                        Icon(Icons.add_box_outlined),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Create New Account",
                          style: TextStyle(fontSize: 16),
                        )
                      ],),
                  ),
                  onPressed: () {
                    _auth.signOut();
                    Get.offAll(RegisterScreen());
                  },
                ),
              ],
            ),
          )),
    );
  }
}
