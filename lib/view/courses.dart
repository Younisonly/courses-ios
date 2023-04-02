import 'package:courses/widgets/constants.dart';
import 'package:courses/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/addCoursesModel.dart';
import '../model/search_model.dart';
import '../view_model/auth.dart';
import '../view_model/screens_view_model.dart';
import 'add_courses.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchModel>(
      init: SearchModel(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: const CustomText(
              text: "Courses",
              color: Colors.white,
            ),
          ),
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  _searchTextFormField(),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 700,
                    child: controller.coursesSearch(),
                  ),
                ]),
              ],
            ),
          ),
          floatingActionButton: GetBuilder<ScreenViewModel>(
              builder: (controller) => controller.setWidget('courses'))),
    );
  }

  Widget _searchTextFormField() {
    return GetBuilder<SearchModel>(
        init: SearchModel(),
        builder: (controller) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: TextFormField(
                onChanged: (value) {
                  controller.courseSearchValue = value;
                  controller.category = 'null';
                  controller.coursesSearch();
                },
                decoration: const InputDecoration(
                  hintText: "Search Here",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ));
  }
}
