import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/person.dart';
import 'package:kisiler_uygulamasi/ui/Cubits/HomePageCubit.dart';
import 'package:kisiler_uygulamasi/ui/view/detail_page.dart';
import 'package:kisiler_uygulamasi/ui/view/kayit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool searchcontrol = false;




@override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().personLoad(); //sayfa açıldığı anda cubitteki kişileri yükle fonksiyonu çalıştır.
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: searchcontrol ? TextField(decoration:InputDecoration(hintText: "search") ,
        onChanged: (searchResult){
          context.read<HomePageCubit>().search(searchResult);
        },
      ):
      const Text("Person"),
      actions: [
        searchcontrol ?
        IconButton(onPressed: (){
          setState(() {
            searchcontrol =false;
          });
          context.read<HomePageCubit>().personLoad();
        },icon: Icon(Icons.clear)):

        IconButton(onPressed: (){
          setState(() {
            searchcontrol = true;
          });
        },icon: Icon(Icons.search))
      ],
      ),


      body:BlocBuilder<HomePageCubit,List<Person>>( //emit ile gelen veriyi dinledik.
        builder: (context,personlist){
          if(personlist.isNotEmpty){ // emit ile gelen liste boş değilse
              return ListView.builder(
                itemCount: personlist.length,
                itemBuilder: (context, index) {
                  var person = personlist[index];  // Her bir person nesnesini alır.
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PersonDetail(person: person)))
                          .then((value) {
                        print("anasayfaya dönüldü");
                      });

                    },
                    child: Card(
                      color: Colors.green,
                      elevation: 4.0,  // Kartın gölgesini belirler.
                      margin: const EdgeInsets.all(8.0),  // Kart aralıklarını belirler.
                      child: ListTile(
                        leading: CircleAvatar(  // Kişinin baş harfi ile bir avatar oluşturur.
                          child: Text(person.person_name[0].toUpperCase()),
                        ),
                        title: Text(person.person_name,style: TextStyle(color: Colors.white),),  // Kişinin adını gösterir.
                        subtitle: Text(person.person_phone,style: TextStyle(color: Colors.white)),  // Kişinin telefon numarasını gösterir.
                        trailing: IconButton(  // Silme ikonu ekler.
                          icon: Icon(Icons.delete, color: Colors.black54),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("Are you sure want to deleete ${person.person_name}"),
                                  action:  SnackBarAction(
                                    label: "Yes",
                                    onPressed: (){
                                      context.read<HomePageCubit>().deletePerson(person.person_id);
                                      },
                                  ),
                              )
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              );

          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPerson()))
              .then((value) {
            print("anasayfaya dönüldü");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
