class UserModel {
  late var userId, email, name, pic,type=0,number;

  UserModel({this.userId, this.email, this.name, this.pic, this.number});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    number= map['number'];
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'number':number,
      'type':type,
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
