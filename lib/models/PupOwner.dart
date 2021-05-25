class PupOwner {
  String email = '';
  String pupName = '';
  String pupFood = '';
  int pupAge = 0;
  String imgPath = 'images/charlie_3.jpeg';
  String id = '';

  PupOwner({this.email, this.pupName, this.pupFood, this.pupAge, this.imgPath});

  void setEmail(String email) {
    this.email = email;
  }

  void setPupName(String pupName) {
    this.pupName = pupName;
  }

  void setPupFood(String pupFood) {
    this.pupFood = pupFood;
  }

  void setAge(int age) {
    this.pupAge = age;
  }

  void setImgPath(String path) {
    this.imgPath = path;
  }
}
