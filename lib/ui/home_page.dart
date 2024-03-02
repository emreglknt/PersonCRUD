import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/person.dart';
import 'package:kisiler_uygulamasi/ui/detail_page.dart';
import 'package:kisiler_uygulamasi/ui/kayit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool searchcontrol = false;


  Future<void> search(String searchQuery) async{
    print("search person : $searchQuery");
  }


  Future<void> deletePerson(int person_id) async{
    print("Deleted Person: $person_id");
  }



  Future<List<Person>> personLoad() async{
    var listPerson = <Person>[];
    var p1 = Person(person_id: 1, person_name: "Emre", person_phone: "05319845130");
    var p2 = Person(person_id: 2, person_name:"mehmet", person_phone:"05312657895");
    var p3 = Person(person_id: 3, person_name: "poyraz", person_phone:"05426551915");
    var p4 = Person(person_id: 3, person_name: "ahmet", person_phone:"05426531918");
    var p5 = Person(person_id: 3, person_name: "toprak", person_phone:"05426537925");
    listPerson.add(p1);
    listPerson.add(p2);
    listPerson.add(p3);
    listPerson.add(p4);
    listPerson.add(p5);
    return listPerson;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: searchcontrol ? TextField(decoration:InputDecoration(hintText: "search") ,
        onChanged: (searchResult){
          search(searchResult);
        },
      ):
      const Text("Person"),
      actions: [
        searchcontrol ?
        IconButton(onPressed: (){
          setState(() {
            searchcontrol =false;
          });
        },icon: Icon(Icons.clear)):

        IconButton(onPressed: (){
          setState(() {
            searchcontrol = true;
          });
        },icon: Icon(Icons.search))
      ],
      ),


      body: FutureBuilder<List<Person>>(
        future: personLoad(),
        builder: (context,snapshot){
          if(snapshot.hasData && snapshot.data != null){
              var personlist = snapshot.data;
              return ListView.builder(
                itemCount: personlist?.length,  // personlist, snapshot.data'dan gelen verileri içerir.
                itemBuilder: (context, index) {
                  var person = personlist![index];  // Her bir person nesnesini alır.
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
                                      deletePerson(person.person_id);
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
