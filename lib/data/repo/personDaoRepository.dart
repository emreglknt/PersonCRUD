import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi/data/entity/person.dart';
import 'package:kisiler_uygulamasi/data/entity/personResponse.dart';

class PersonDaoRepository{



  List<Person> parsePerson(String response){
    return PersonResponse.fromJson(json.decode(response)).person;
  }




  Future<List<Person>> personLoad() async{
    var baseurl = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var response = await Dio().get(baseurl);
    return parsePerson(response.data.toString());

  }



  // Add person
  Future<void> register(String person_name,String person_phone) async{
    var baseurl = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad":person_name,"kisi_tel":person_phone};
    var response = await Dio().post(baseurl,data: FormData.fromMap(veri));
    print("kisi kaydet : ${response.data.toString()}");
  }


  //UPDATE işlemini asenkron olarak yapmamızı sağlar  Future - async
  Future<void> update(int person_id,String person_name,String person_phone) async{
    var baseurl = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id":person_id,"kisi_ad":person_name,"kisi_tel":person_phone};
    var response = await Dio().post(baseurl,data: FormData.fromMap(veri));
    print("kisi güncelle : ${response.data.toString()}");
  }





  //SEARCH
  //aranan kelimeye göre dbdeki satırları bulur ve maps içine atar
  // kaç adet o kelimeden kayıt varsa liste halinde bize verir.
  Future<List<Person>> search(String searchQuery) async{
    var baseurl = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
    var veri = {"kisi_ad":searchQuery};
    var response = await Dio().post(baseurl,data: FormData.fromMap(veri));
    return parsePerson(response.data.toString());
  }


  //DELETE
  Future<void> deletePerson(int person_id) async{
    var baseurl = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id":person_id};
    var response = await Dio().post(baseurl,data: FormData.fromMap(veri));
    print("kisi sil : ${response.data.toString()}");

  }




}