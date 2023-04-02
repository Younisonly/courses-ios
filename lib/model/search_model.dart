import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/Details_Screen.dart';

class SearchModel extends GetxController {
  String courseSearchValue = "";
  String trainingSearchValue = "";
  String category = 'null';

  SearchModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    update();
  }

////////////////searching/////////////////////
  Widget coursesSearch() {
    update();
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Courses').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<dynamic, dynamic>;
                    if (category == 'null') {
                      if (courseSearchValue?.isEmpty ?? true) {
                        return ListTile(
                          title: Text(
                            data['name'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(data['publisher_name']),
                          leading: GestureDetector(
                            onTap: () {
                              Get.to(DetailsScreen(model: data));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white38,
                              radius: 25,
                              backgroundImage: NetworkImage(data['image']),
                            ),
                          ),
                        );
                      }
                      if (data['name']
                          .toString()
                          .toLowerCase()
                          .contains(courseSearchValue.toLowerCase())) {
                        // CoursesList.add(data);
                        return ListTile(
                          title: Text(
                            data['name'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(data['publisher_name']),
                          leading: GestureDetector(
                            onTap: () {
                              Get.to(DetailsScreen(model: data));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white38,
                              radius: 25,
                              backgroundImage: NetworkImage(data['image']),
                            ),
                          ),
                        );
                      }
                    } else {
                      if (data['category']
                          .toString()
                          .toLowerCase()
                          .startsWith(category.toLowerCase())) {
                        print(data['category']);
                        return ListTile(
                          title: Text(
                            data['name'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(data['publisher_name']),
                          leading: GestureDetector(
                            onTap: () {
                              Get.to(DetailsScreen(model: data));
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white38,
                              radius: 25,
                              backgroundImage: NetworkImage(data['image']),
                            ),
                          ),
                        );
                      }
                    }
                    return Container();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: snapshot.data!.docs.length);
        });
  }

  Widget trainingSearch() {
    update();
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Trainings').snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<dynamic, dynamic>;

                    if (trainingSearchValue?.isEmpty ?? true) {
                      return ListTile(
                        title: Text(
                          data['name'].toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data['publisher_name']),
                        leading: GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(model: data));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white38,
                            radius: 25,
                            backgroundImage: NetworkImage(data['image']),
                          ),
                        ),
                      );
                    }
                    if (data['name']
                        .toString()
                        .toLowerCase()
                        .contains(trainingSearchValue.toLowerCase())) {
                      return ListTile(
                        title: Text(
                          data['name'].toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(data['publisher_name']),
                        leading: GestureDetector(
                          onTap: () {
                            Get.to(DetailsScreen(model: data));
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white38,
                            radius: 25,
                            backgroundImage: NetworkImage(data['image']),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 20,
                      ),
                  itemCount: snapshot.data!.docs.length);
        });
  }
}
