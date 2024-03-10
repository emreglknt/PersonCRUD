import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/personDaoRepository.dart';

class DetailPageCubit extends Cubit<void>{

  DetailPageCubit():super(0);

  var pRepo = PersonDaoRepository(); // repo objesi oluşturduk repodaki methodlara erişmek için.

  //update işlemini asenkron olarak yapmamızı sağlar  Future - async - await
  Future<void> update(int person_id,String person_name,String person_phone) async{
    await pRepo.update(person_id, person_name, person_phone);
  }


}