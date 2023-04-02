import 'package:courses/widgets/custom_text.dart';
import 'package:courses/view/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/auth.dart';
import '../widgets/constants.dart';

class LoginScreen extends GetWidget<Auth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body:
        ListView(
          children: [
           Padding(
              padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const CustomText(
                            text: "Welcome,",
                            fontSize: 25,
                          ),
                         GestureDetector(
                            onTap: (){
                              Get.to(RegisterScreen());
                            },
                            child: const CustomText(
                              text: "Sign Up",
                              fontSize: 15,
                              color: primaryColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        text: 'sign in to continue',
                        color: Colors.grey,
                        fontSize: 9,
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      Column(
                        children: [
                          CustomText(
                            text: "Email",
                            fontSize: 14,
                            color: Colors.grey.shade900,
                          ),
                          TextFormField(
                            onSaved: (value) => {controller.email = value!},
                            validator: (value) {
                              if (value == null) {
                                print("error");
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "example@gmail.com",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 35,
                      ),

                      Column(
                        children: [
                          CustomText(
                            text: "password",
                            fontSize: 14,
                            color: Colors.grey.shade900,
                          ),
                          TextFormField(
                            onSaved: (value) => {controller.password = value!},
                            validator: (value) {
                              if (value == null) {
                                print("error");
                              }
                            },
                            decoration: const InputDecoration(
                              hintText: "*******",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              fillColor: Colors.white,
                            ),
                          )
                        ],
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      const CustomText(
                        text: "forget password!!",
                        alignment: Alignment.topRight,
                        fontSize: 14,
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      TextButton(
                        onPressed: () {
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate()) {
                            controller.signInWithEmailAndPassword();
                          }
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(9.0)),
                          alignment: Alignment.center,
                          backgroundColor: primaryColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 7, right: 80, left: 80, bottom: 7),
                          child: CustomText(
                              color: Colors.white,
                              alignment: Alignment.center,
                              fontSize: 18,
                              text: "sign in"),
                        ),
                      ),

                    ],
                  ))),
        ],));
  }
}
