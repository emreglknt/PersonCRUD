import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/person.dart';
import 'package:kisiler_uygulamasi/data/repo/personDaoRepository.dart';

class HomePageCubit extends Cubit<List<Person>>{

  HomePageCubit():super(<Person>[]);//constructor boş person list alıyor


  var pRepo = PersonDaoRepository();


  Future<void> personLoad() async{
      var pList = await pRepo.personLoad();
      emit(pList); // repodan gelen person türündeki listeyi arayüz sınıfına gönderir.
                    // arayüzde de bu emiti dinleyerek gelen listeyi alacağız.
  }


  Future<void> search(String searchQuery) async{
    var pList = await pRepo.search(searchQuery);
    emit(pList);
  }


  Future<void> deletePerson(int person_id) async{
    await pRepo.deletePerson(person_id);
    await personLoad(); // silinen kişiyi arayüzde güncelleyerek kaldırmak için kullandık.
  }




}