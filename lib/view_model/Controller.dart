import 'package:courses/view_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens_view_model.dart';
import '../view/login_screen.dart';
import '../widgets/constants.dart';


class ControlView extends GetWidget<Auth> {
   const ControlView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Get.put(Auth(),permanent: true);
      return (Get.find<Auth>().user == null)
          ? LoginScreen()
          : GetBuilder<ScreenViewModel>(
          init: ScreenViewModel(),
          builder: (controller) => Scaffold(
            body: controller.currentScreen,
            bottomNavigationBar: bottomNavigationBar(),
          ));
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ScreenViewModel>(
      init: ScreenViewModel(),
      builder: (controller) => BottomNavigationBar(
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "courses",
            ),
            BottomNavigationBarItem(
              // activeIcon:
              icon: Icon(Icons.ads_click),
              label: "Training",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Me",
            )
          ],
          currentIndex: controller.navigatorValue,
          onTap: (index) {
            controller.changeSelectedValue(index);

          }),
    );
  }

}
