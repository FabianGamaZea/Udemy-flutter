import 'package:flutter/material.dart';
import 'package:flutter_components/screens/listview1_screen.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Componentes en flutter"),
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) =>
           ListTile(
            title: const Text("Nombre ruta"),
            leading: const Icon(Icons.abc_rounded),
            onTap:(){

              // permite la contruccion de un Widget
              final route = MaterialPageRoute(builder: (context) => const Listview1Screen());
              Navigator.push(context, route);
              
            },
        
          ),
        
        separatorBuilder: (context, index) => const Divider(), 
        itemCount: 10 )
    );
  }
}