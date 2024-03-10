import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/person.dart';
import 'package:kisiler_uygulamasi/ui/Cubits/DetailPageCubit.dart';

class PersonDetail extends StatefulWidget {

  //anasayfadan bu classın costructor una  Person dan oluşan bir lişi nesnesi alır.
  Person person;
  PersonDetail({required this.person});

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  var tfPersonName = TextEditingController();
  var tfPersonPhone = TextEditingController();



  // anasayafan gelen verideki name ve phonu textfieldlara ekran açıldığında yerleştirir.
  @override
  void initState() {
    super.initState();
    var person = widget.person; //widget ile objeyi alabiliyoruz.
    tfPersonName.text = person.person_name;
    tfPersonPhone.text = person.person_phone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details "),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPersonName,decoration:  InputDecoration(hintText: "Person Name"),),
              TextField(controller: tfPersonPhone,decoration: InputDecoration(hintText: "Person Phone Number"),),
              ElevatedButton(onPressed:(){
                context.read<DetailPageCubit>().update(widget.person.person_id, tfPersonName.text, tfPersonPhone.text);
              }, child: const Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
