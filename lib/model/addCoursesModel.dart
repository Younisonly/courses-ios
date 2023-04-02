import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courses/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCoursesModel extends GetxController {
  AddCoursesModel();

  var name, description, publisher_name, publisherNum, category, type, image;

  SelectedCategory(var x) {
    category = x;
    update();
  }

  SelectedType(var x) {
    type = x;
    update();
  }

  submitCourse(
      name, category, type, publisher_name, publisher_num, description) {
    switch (category) {
      case 'Math':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Math.png?alt=media&token=925213ee-dc6b-4a9b-88be-1c4af4bb77f3';
          break;
        }
      case 'Programming':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Programming.png?alt=media&token=36c3aed6-289b-459a-af90-49e064a346ee';
          break;
        }
      case 'Electronics':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Electronics.png?alt=media&token=eaf88eec-5a4e-4b0d-b746-69b1b8339e19';
          break;
        }
      case 'Medicine':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Medicine.png?alt=media&token=3518b463-a1bf-4200-9d3f-774d0562157e';
          break;
        }
      case 'Languages':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Languages.png?alt=media&token=574586d2-ca52-4b61-b7f1-3691edfc6630';
          break;
        }
      case 'Architectural':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Architectural.png?alt=media&token=3a6756f4-95df-4186-8b76-fe575ecde04a';
          break;
        }
      case 'Law':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Law.png?alt=media&token=181f56b6-c207-45cb-b15a-30cf470af2f2';
          break;
        }
      case 'Sport':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Sport.png?alt=media&token=8474dee1-88cc-4d70-8411-1a02a0b3430f';
          break;
        }
      case 'Trading':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Trading.png?alt=media&token=469ad46a-4996-45c3-b525-bdbfcc717f75';
          break;
        }
      case 'Designing':
        {
          image =
              'https://firebasestorage.googleapis.com/v0/b/my-courses-9ed76.appspot.com/o/Designing.png?alt=media&token=ac4c4a26-9692-4994-b947-d060ba797cce';
          break;
        }
    }
    final CollectionReference course =
        FirebaseFirestore.instance.collection('Courses');
    try {
      if (name == null || name == "") {
        Get.snackbar(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          "field required!",
          "Name field can not be empty!",
          colorText: Colors.redAccent,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (type == null) {
        Get.snackbar(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          "field required!",
          "type field can not be empty!",
          colorText: Colors.redAccent,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (publisher_name == null || publisher_name == "") {
        Get.snackbar(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          "field required!",
          "publisher name field can not be empty!",
          colorText: Colors.redAccent,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (publisher_num == null || publisher_num == "") {
        Get.snackbar(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          "field required!",
          "publisher number field can not be empty!",
          colorText: Colors.redAccent,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (description == null || description == "") {
        Get.snackbar(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          "field required!",
          "description field can not be empty!",
          colorText: Colors.redAccent,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        course.add({
          'publisher_name': publisher_name,
          'publisher_num': publisher_num,
          'name': name,
          'description': description,
          'category': category,
          'type': type,
          'image': image,
          'courseID': FirebaseFirestore.instance.collection('Courses').doc().id,
        });
        Get.snackbar(
          icon: const Icon(
            Icons.done_all,
            color: primaryColor,
          ),
          "successfully done",
          "one course was added to firebase!",
          colorText: primaryColor,
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        icon: const Icon(Icons.error),
        'Error adding course:',
        e.toString(),
        backgroundColor: Colors.white,
        colorText: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}


