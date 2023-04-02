import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
  FirebaseFirestore.instance.collection('Category');
  final CollectionReference _coursesCollectionRef =
  FirebaseFirestore.instance.collection('Courses');
  final CollectionReference _trainingsCollectionRef =
  FirebaseFirestore.instance.collection('Trainings');
  final CollectionReference _statisticsCollectionRef =
  FirebaseFirestore.instance.collection('Statistics ');
  final CollectionReference _usersCollectionRef =
  FirebaseFirestore.instance.collection('Users');


  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCourses() async {
    var value = await _coursesCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getTrainings() async {
    var value = await _trainingsCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getStatistics() async {
    var value = await _statisticsCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getUsers() async {
    var value = await _usersCollectionRef.get();
    return value.docs;
  }}

