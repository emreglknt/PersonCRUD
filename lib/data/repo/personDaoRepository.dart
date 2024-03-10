import 'package:kisiler_uygulamasi/data/entity/person.dart';
import 'package:kisiler_uygulamasi/sqlite/database_builder.dart';

class PersonDaoRepository{

  // kayıt
  Future<void> register(String person_name,String person_phone) async{
    print("Person register : $person_name - $person_phone");
  }


  //update işlemini asenkron olarak yapmamızı sağlar  Future - async
  Future<void> update(int person_id,String person_name,String person_phone) async{
    print("Person Update : $person_id - $person_name - $person_phone");
  }



  Future<List<Person>> personLoad() async{
    var db = await DataBaseBuilder.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("select * from persons");

    return List.generate(maps.length, (index) {
      var row = maps[index]; // db deki kişi tableında ilk satır alındı.

      //kaç tane row varsa (kişi kayıtı dbde ) table name tagleri ile değerlerini alarak  person nesneslerini oluşturur.
      return Person(person_id: row["p_id"], person_name: row["p_name"], person_phone: row["p_phone"]);
    });

  }


  //arama
  Future<List<Person>> search(String searchQuery) async{
    var listPerson = <Person>[];
    var p1 = Person(person_id: 1, person_name: "Emre", person_phone: "05319845130");
    listPerson.add(p1);
    return listPerson;
  }


  //silme
  Future<void> deletePerson(int person_id) async{
    print("Deleted Person: $person_id");
  }




}