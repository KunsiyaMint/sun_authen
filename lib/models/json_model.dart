class JsonModel {
  // Create Field
  int id;
  String name, user, password;

  // Constructor
  // JsonModel(int idInt, String nameString, String userString, String passwordString){
  //   id =idInt;
  //   name =nameString;
  //   user =userString;
  //   password =passwordString;
  // }
  // สิ่งที่ทำการส่งมาจะเปน OBJECT ต้องทำการแปลง

  JsonModel(this.id, this.name, this.user, this.password);

  JsonModel.fromJson(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['Id']);
    name = parseJSON['Name'];
    user = parseJSON['User'];
    password = parseJSON['Password'];
  }
}
