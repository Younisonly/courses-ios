class StatisticsModel  {
  late String name, image;

  StatisticsModel({required this.image,required this.name}) ;

  StatisticsModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }


}
