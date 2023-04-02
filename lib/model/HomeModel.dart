import 'package:courses/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../helper/colection_services.dart';
import 'Category_model.dart';
import 'Training_model.dart';
import 'courses_model.dart';
import 'statistics_model.dart';

class HomeViewModel extends GetxController {
  late int likes, dislikes;
  late CoursesModel model;
  Map amount = {'courses': 0, 'users': 0, 'training': 0};

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  List<UserModel> usersModel = [];
  List<CoursesModel> coursesList = [];
  List<TrainingModel> trainingList = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];
  List<StatisticsModel> get statisticsModel => _statisticsModel;
  List<StatisticsModel> _statisticsModel = [];
  HomeViewModel() {
    getCategory();
    getStatistics();
    trainingAmount();
    coursesAmount();
    usersAmount();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoryModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getStatistics() async {
    _loading.value = true;
    HomeService().getStatistics().then((value) async {
      for (int i = 0; i < value.length; i++) {
        _statisticsModel.add(
            StatisticsModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  usersAmount() async {
    _loading.value = true;
    HomeService().getUsers().then((value) {
      for (int i = 0; i < value.length; i++) {
        usersModel
            .add(UserModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      amount['users'] = usersModel.length;
    });
    update();
  }

  trainingAmount() async {
    _loading.value = true;
    HomeService().getTrainings().then((value) {
      for (int i = 0; i < value.length; i++) {
        trainingList.add(
            TrainingModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      amount['Training'] = trainingList.length;
    });
    update();
  }

  coursesAmount() async {
    _loading.value = true;
    HomeService().getCourses().then((value) {
      for (int i = 0; i < value.length; i++) {
        coursesList.add(
            CoursesModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      amount['Courses'] = coursesList.length;
    });
    update();
  }

}
