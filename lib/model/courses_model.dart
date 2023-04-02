class CoursesModel {
  late dynamic description,
      name,
      publisher,
      type,
      category,
      likes,
      dislikes,
      views,
      publisher_name,
      publisher_num;

  CoursesModel();

  CoursesModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    description = map['description'];
    publisher_name = map['publisher_name'];
    name = map['name'];
    publisher_num = map['publisher_num'];
    category = map['category'];
    type = map['type'];
    views = map['views'];
    likes = map['likes'];
    dislikes = map['dislikes'];

  }
}