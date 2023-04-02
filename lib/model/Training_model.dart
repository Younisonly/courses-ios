class TrainingModel {
  dynamic description,
      name,
      publisher,
      category,
      publisher_num,
      publisher_name,
      views,
      likes,
      dislikes,
      image;

  TrainingModel();

  TrainingModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    description = map['description'];
    publisher_name = map['publisher_name'];
    name = map['name'];
    publisher_num = map['publisher_num'];
    category = map['category'];
    views = map['views'];
    likes = map['likes'];
    dislikes = map['dislikes'];
    image = map['image'];
  }
}
