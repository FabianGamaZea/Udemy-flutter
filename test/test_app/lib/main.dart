import 'package:flutter/material.dart';
import 'package:test_app/screen/counter_screen.dart';
import 'package:test_app/screen/home_screen.dart';
import 'package:test_app/screen/tabla_reponsiv.dart';
import 'package:test_app/screen/test_tabla.dart';

void main() {
 runApp( const MyApp()) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
   return const MaterialApp(
    debugShowCheckedModeBanner: false,      //Desaparece la etiqueta debug
    home: Test_tabla()
    //home:CounterScreen()
   // home:MyDataTable()
   );
  }
  

}
