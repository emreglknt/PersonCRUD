import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/ui/Cubits/DetailPageCubit.dart';
import 'package:kisiler_uygulamasi/ui/Cubits/HomePageCubit.dart';
import 'package:kisiler_uygulamasi/ui/Cubits/KayitPageCubit.dart';
import 'package:kisiler_uygulamasi/ui/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>KayitPageCubit()),
        BlocProvider(create: (context)=> DetailPageCubit()),
        BlocProvider(create: (context)=> HomePageCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
