import 'package:kisiler_uygulamasi/data/entity/person.dart';
import 'package:kisiler_uygulamasi/sqlite/database_builder.dart';

class PersonDaoRepository{

  // Register
  Future<void> register(String person_name,String person_phone) async{
    var db = await DataBaseBuilder.veritabaniErisim();
    var newPerson = Map<String,dynamic>();
    newPerson["p_name"] = person_name;//tablolardaki taglere göre alınan name ve phone aktar
    newPerson["p_phone"] = person_phone; //idsi otomatik oluşacak.
    await db.insert("persons", newPerson); // db ye bu değişkeni insert et.

  }


  //UPDATE işlemini asenkron olarak yapmamızı sağlar  Future - async
  Future<void> update(int person_id,String person_name,String person_phone) async{
    var db = await DataBaseBuilder.veritabaniErisim();
    var updatedPerson = Map<String,dynamic>();
    updatedPerson["p_name"] = person_name;//tablolardaki taglere göre alınan name ve phone aktar
    updatedPerson["p_phone"] = person_phone; //idsi otomatik oluşacak.
    //gelen id deki person ı yeni değerlerle persons table ında db de güncelle.
    await db.update("persons", updatedPerson,where:"p_id = ?",whereArgs: [person_id]);

  }



  Future<List<Person>> personLoad() async{
    var db = await DataBaseBuilder.veritabaniErisim();
    //değişebilir bir tür olduğundan dynamic kullandık.
    List<Map<String,dynamic>> maps = await db.rawQuery("select * from persons");

    return List.generate(maps.length, (index) {
      var row = maps[index]; // db deki kişi tableında ilk satır alındı.

      //kaç tane row varsa (kişi kayıtı dbde ) table name tagleri ile değerlerini alarak  person nesneslerini oluşturur.
      return Person(person_id: row["p_id"], person_name: row["p_name"], person_phone: row["p_phone"]);

    });

  }


  //SEARCH
  //aranan kelimeye göre dbdeki satırları bulur ve maps içine atar
  // kaç adet o kelimeden kayıt varsa liste halinde bize verir.
  Future<List<Person>> search(String searchQuery) async{
    var db = await DataBaseBuilder.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("select * from persons WHERE p_name like '%$searchQuery%' ");
    return List.generate(maps.length, (index)
    {
      var row = maps[index];
      return Person(person_id: row["p_id"], person_name: row["p_name"], person_phone: row["p_phone"]);
    });
  }


  //DELETE
  Future<void> deletePerson(int person_id) async{
    var db = await DataBaseBuilder.veritabaniErisim();
    await db.delete("persons",where:"p_id = ?",whereArgs: [person_id]);

  }




}