import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../model/addCoursesModel.dart';
import '../widgets/constants.dart';
import '../widgets/custom_text.dart';

class AddCourses extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddCourses({Key? key}) : super(key: key);
  List categoryItems = [
    "Math",
    "Programming",
    "Electronics",
    "Medicine",
    "Languages",
    "Architectural",
    "Law",
    "Sport",
    "Trading",
    "Designing",
  ];

  List typeItems = ['OnLine', 'Real Time'];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCoursesModel>(
        init: AddCoursesModel(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                title: const CustomText(
                  text: "Add a courses",
                  color: Colors.white,
                ),
              ),
              body: ListView(children: [
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                          key: _formKey,
                        child:  Column(children: [
                              const CustomText(
                              text: "Please fill out all the fields with "
                          "accurate values!",
                           color: primaryColor,),
                        const SizedBox(
                          height: 25,
                        ),
                        const CustomText(
                          text: "name:",
                        ),
                        TextFormField(
                          onSaved: (value) => {controller.name = value!},
                          decoration: const InputDecoration(
                            hintText: "Course name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const CustomText(
                                text: "Category:",
                              ),
                              const SizedBox(
                                width: 45,
                              ),
                              DropdownButton(
                                hint: const CustomText(
                                    text: "category (optional)",
                                    color: Colors.grey),
                                icon: const Icon(Icons.arrow_drop_down),
                                onChanged: (newValue) {
                                  controller.SelectedCategory(newValue);
                                },
                                value: controller.category,
                                items: categoryItems.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const CustomText(
                                text: "Type:",
                              ),
                              const SizedBox(width: 79),
                              DropdownButton(
                                hint: const CustomText(
                                    text: "choose the type", color: Colors.grey),
                                icon: const Icon(Icons.arrow_drop_down),
                                onChanged: (newValue) {
                                  controller.SelectedType(newValue);
                                },
                                value: controller.type,
                                items: typeItems.map((valueItem) {
                                  return DropdownMenuItem(
                                    child: Text(valueItem),
                                    value: valueItem,
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const CustomText(
                          text: "publisher name:",
                        ),
                        TextFormField(
                          onSaved: (value) =>
                              {controller.publisher_name = value!},
                          decoration: const InputDecoration(
                            hintText: "publisher name",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const CustomText(
                          text: "publisher number:",
                        ),
                        TextFormField(
                          keyboardType:
                              const TextInputType.numberWithOptions(decimal: true),
                          onSaved: (value) => {controller.publisherNum = value!},
                          decoration: const InputDecoration(
                            hintText: "publisher number",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const CustomText(
                          text: "Description:",
                        ),
                        TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onSaved: (value) => {controller.description = value!},
                          decoration: const InputDecoration(
                            hintText: "Course description",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextButton(
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
                                text: "Add course"),
                          ),
                          onPressed: () {
                            _formKey.currentState?.save();
                            controller.submitCourse(
                                controller.name,
                                controller.category,
                                controller.type,
                                controller.publisher_name,
                                controller.publisherNum,
                                controller.description,
                            );
                          },
                        ),
                      ]),
                    )),
               ]),
            ));
  }
}
