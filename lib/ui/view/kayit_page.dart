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
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 6.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextField(
                    controller: tfPersonName,
                    decoration: InputDecoration(
                      hintText: "Person Name",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: tfPersonPhone,
                    decoration: InputDecoration(
                      hintText: "Person Phone Number",
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: (){
                      context.read<KayitPageCubit>().register(tfPersonName.text, tfPersonPhone.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Background color
                      onPrimary: Colors.white, // Text color
                      elevation: 3, // Shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Rounded corners
                      ),
                    ),
                    child: const Text("Register"),
                  ),
                  SizedBox(height: 5),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
