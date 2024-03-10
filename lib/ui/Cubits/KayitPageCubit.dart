
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/personDaoRepository.dart';

class KayitPageCubit extends Cubit<void> {

  KayitPageCubit():super(0);

  var prepo = PersonDaoRepository(); 
  Future<void> register(String person_name,String person_phone) async{
    await prepo.register(person_name, person_phone);
  }


}