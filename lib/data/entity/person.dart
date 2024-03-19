class Person{

  String person_id;
  String person_name;
  String person_phone;

  //constructor
  Person({
    required this.person_id,
    required this.person_name,
    required this.person_phone});



// json objesi ile gelen veriyi map ile parse ederek
// person objesindeki özelliklere atıyor.
  factory Person.fromJson(Map<String,dynamic> json){
    return Person(
        person_id: json["kisi_id"] as String,
        person_name: json["kisi_ad"]as String,
        person_phone: json["kisi_tel"]as String);
  }


}