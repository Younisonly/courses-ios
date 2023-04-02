import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/Training.dart';
import '../view/add_courses.dart';
import '../view/add_training.dart';
import '../view/courses.dart';
import '../view/home_screen.dart';
import '../view/profile.dart';
import '../widgets/constants.dart';
import 'Controller.dart';

class ScreenViewModel extends GetxController {
  ScreenViewModel(){
    getUserInfo();
  }
  int _navigatorValue = 2;
  Widget _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;

  get navigatorValue => _navigatorValue;


  changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = Courses();
          ControlView();
          update();
          break;
        }
      case 1:
        {
          _currentScreen = Training();
          ControlView();
          update();
          break;
        }
      case 2:
        {
          _currentScreen = HomeScreen();
          ControlView();
          update();
          break;
        }
      case 3:
        {
          _currentScreen = profile();
          ControlView();
          update();
          break;
        }
    }
    update();
  }



  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String Type = '';
  Map<dynamic, dynamic> UserInfo = {};
  getUserInfo() {
    update();
    final User? user = _auth.currentUser;
    FirebaseFirestore.instance.collection('Users').where(
        'email', isEqualTo: user?.email).get().then((value) {
      UserInfo = value.docs[0].data();
      Type = UserInfo['type'].toString();
      if (UserInfo['type'].toString() == '0') {
        Type = 'user';
      }
      else if (UserInfo['type'].toString() == '1') {
        Type = 'Admin';
      }
      return;
    });
  }

  Widget setWidget(page){
    dynamic routingPage;
    if(page=='courses'){
      routingPage=AddCourses();
    }
    else if (page=='training'){
      routingPage=AddTraining();
    }

    if (Type == 'Admin') {
      return FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Get.to(routingPage);
        },
        child: const Text("add"),
      );
    }
    return Container();
  }
}
