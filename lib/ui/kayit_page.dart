import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPerson extends StatefulWidget {
  const RegisterPerson({super.key});

  @override
  State<RegisterPerson> createState() => _RegisterPersonState();
}

class _RegisterPersonState extends State<RegisterPerson> {

 var tfPersonName = TextEditingController();
 var tfPersonPhone = TextEditingController();

 //register işlemini asenkron olarak yapmamızı sağlar  Future - async
 Future<void> register(String person_name,String person_phone) async{
   print("Person register : $person_name - $person_phone");
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfPersonName,decoration:  InputDecoration(hintText: "Person Name"),),
              TextField(controller: tfPersonPhone,decoration: InputDecoration(hintText: "Person Phone Number"),),
              ElevatedButton(onPressed:(){
                register(tfPersonName.text, tfPersonPhone.text); // textfieldlardan aldığımız verilerin textini register fonksiyonuna gönderioruz.
              }, child: const Text("Register"))
            ],
          ),
        ),
      ),

    );
  }
}
