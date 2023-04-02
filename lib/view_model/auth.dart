import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/user_model.dart';
import '../helper/Inserting.dart';
import 'Controller.dart';
class Auth extends GetxController {
  dynamic email, password, name, number;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _user = Rxn<User>();
  get user => _user.value?.email;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    update();
    _user.bindStream(_auth.authStateChanges());
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(const ControlView());
      update();
    } catch (e) {
      Get.snackbar(
        icon: const Icon(Icons.error),
        'Error login account',
        e.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  Future createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        UserModel userModel = UserModel(
            email: user.user?.email,
            name: name,
            pic: "",
            number:number,
            userId: user.user?.uid);
        await FireStoreUser().addUserToFireStore(userModel);
      });

      Get.offAll(const ControlView());
      update();
    } catch (e) {
      Get.snackbar(
        icon: const Icon(Icons.error),
        'Error registering account',
        e.toString(),
        colorText: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }



}
