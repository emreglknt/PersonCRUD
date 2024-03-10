import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/ui/Cubits/KayitPageCubit.dart';
import 'package:kisiler_uygulamasi/ui/view/home_page.dart';

class RegisterPerson extends StatefulWidget {
  const RegisterPerson({super.key});

  @override
  State<RegisterPerson> createState() => _RegisterPersonState();
}

class _RegisterPersonState extends State<RegisterPerson> {

 var tfPersonName = TextEditingController();
 var tfPersonPhone = TextEditingController();




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
                context.read<KayitPageCubit>().register(tfPersonName.text, tfPersonPhone.text);// textfieldlardan aldığımız verilerin textini Bloc pattern yapıda cubitteki  register fonksiyonuna gönderioruz.
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              }, child: const Text("Register"))
            ],
          ),
        ),
      ),

    );
  }
}
