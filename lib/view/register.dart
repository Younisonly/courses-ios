import 'package:courses/view_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/constants.dart';
import '../widgets/custom_text.dart';
import 'login_screen.dart';

class RegisterScreen extends GetWidget<Auth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
var email, name, password;
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: GestureDetector(
              onTap: () {
                Get.off(LoginScreen());
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
        ),
        body:GetBuilder<Auth>(
          init: Auth(),
          builder: (controller)=> ListView(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const CustomText(
                          text: "Sign Up,",
                          fontSize: 35,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomText(
                          text: "Name",
                          fontSize: 14,
                          color: Colors.grey.shade900,
                        ),
                        TextFormField(
                          onSaved: (value) => {controller.name = value},
                          decoration: const InputDecoration(
                            hintText: "My Name",
                            hintStyle: TextStyle(
                              color: Colors.grey,),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),

                        CustomText(
                          text: "phone number",
                          fontSize: 14,
                          color: Colors.grey.shade900,
                        ),
                        TextFormField(
                          keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                          onSaved: (value) => {controller.number = value},
                          decoration: const InputDecoration(
                            hintText: "My number",
                            hintStyle: TextStyle(
                              color: Colors.grey,),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),

                        CustomText(
                          text: "Email",
                          fontSize: 14,
                          color: Colors.grey.shade900,
                        ),
                        TextFormField(
                          onSaved: (value) => {controller.email = value},
                          decoration: const InputDecoration(
                            hintText: "example@gmail.com",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        CustomText(
                          text: "password",
                          fontSize: 14,
                          color: Colors.grey.shade900,
                        ),
                        TextFormField(
                          onSaved: (value) => {controller.password = value},
                          decoration: const InputDecoration(
                            hintText: "*******",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 55),
                        TextButton(
                          onPressed: () {
                            _formKey.currentState?.save();
                            if (_formKey.currentState!.validate()) {
                            controller.createUserWithEmailAndPassword();}
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
                                text: "sign up"),
                          ),
                        ),
                      ],
                    )))
          ],
        )));
  }
}
