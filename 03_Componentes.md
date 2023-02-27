# Componentes 
## Inicio
### Awesome 
+ Material App
   + `mateapp`	
     + Create a new Material App para el main

+ Stateless Widget	
   + `statelessW`
     + Creates a Stateless widget para pantallas
### Snippets
Acortadores de codgo
1. \> Configure Users Snippets
2. pegarlo en `dart.json`: https://gist.github.com/Klerith/711749216f31996f1a7bf68c815d1385
3. Se manda a llamar con `fl-screen`: crea un nuevo StatelessWidgets
### Estructura

##  Listview
Es una lista de widgets
+ Estructura:
   ```
   body: ListView(
           children: const [
              Text("Hola mundo"),
              Text("Hola mundo"),
              Text("Hola mundo"),
              Text("Hola mundo"),
              Text("Hola mundo"),
              Text("Hola mundo"),
           ],
         )
   ```

##  ListTiles
Se crea a partir de una lista estatica
+ Estructura:
   ```Dart
     ListTile(
                 leading: Icon(Icons.arrow_circle_up),
                 title: Text("Hola"),
               ),
   ```
+ Estructura Iterativa:
   ```Dart
     final opcions = const [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
     ];


   ...opcions.map(
     (game) => ListTile(
               title: Text(game),
	       trailing: const Icon(Icons.arrow_forward_ios_rounded),   // icono lateral
               )
   ```
     > operador spred `...` que estrae cada uno de los elementos de la lista

### Listview.separated
+ Estructura:
   ```Dart
   final opcions = const [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
   ];
   ...

   ...
   ListView.separated(
               separatorBuilder: (__, _) => const Divider(),
               itemCount: opcions.length,
               itemBuilder: (context, index) => ListTile(
                     title: Text(opcions[index]),
                     trailing: const Icon(Icons.arrow_forward_ios_rounded),
                   ))
   ```
### Listview.builder
+ Estructura:
   Es el mismo que el `ListTile.separated` pero sin `separatorBuilder`

### Taps en ListView
+ onTap
   ```Dart
   ListView.separated(
            separatorBuilder: (__, _) => const Divider(),
            itemCount: opcions.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(opcions[index]),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  

		  onTap: () {
                    final game = opcions[index];
                    print(game);
                  },


                ))
   ```
## AppBar
+ Estructura:
   ```Dart
     appBar: AppBar(
       title: const Center(child: Text("Listview Top 2")),
       elevation: 0,
       backgroundColor: Colors.indigo[400],
     ),
   ```
   + elevation: la sombra debajo del appBar
  
## HomeScreen
+ Barrel file (Archivo indice de exportacion)
   + tiene que tener el mismo nombre de la carpeta `screens.dart`
   + tiene las mismas importaciones pero en ves de import export 
     Ejemplo:
     + en `main.dart`
     ```Dart
     ...
     import 'package:flutter_components/screens/screens.dart';
     ...
     ```
     + en `screes/screens.dart`
     ```Dart 
     export 'package:flutter_components/screens/card_screen.dart';
     export 'package:flutter_components/screens/listview1_screen.dart';
     export 'package:flutter_components/screens/listview2_screen.dart';
     export 'package:flutter_components/screens/alert_screen.dart';
     ```
## Rutas iniciales
Menu de Rutas
+ Cerar HomeScreen en `screens/Homescreens.dart`
   + añadir las rutas en `main.dart` 
     ```Dart
           
      void main() => runApp(const MyApp());
       
      class MyApp extends StatelessWidget {
        const MyApp({super.key});
      
      
        @override
        Widget build(BuildContext context) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            //home: const Listview2Screen(),
            initialRoute: 'home',
            routes:  {
              'home' : (BuildContext context ) =>   const HomeScreen(),
              'listview1' : (BuildContext context ) =>    const Listview1Screen(),
              'listview2' : (BuildContext context ) =>   const Listview2Screen(),
              'alert' : (BuildContext context ) =>   const AlertScreen(),
              'card' : (BuildContext context ) =>   const CardScreen(),
      
            },
          );
        }
      }
     ```
     + Trabajar con rutas dinamicas puede derivar de ir a una ruta que no exista, eso se resielve con el metodo MaterialApp.onGenerateRoute: que genera nuevas rutas 

       ```Dart
       onGenerateRoute: (settings) {
         print(settings);

         return MaterialPageRoute(
           builder: (context) => const CardScreen(),
         );
       },
       ```
## Navegacion a otra pantallas
   ```Dart
     // permite la contruccion de un Widget
     final route = MaterialPageRoute(builder: (context) => const Listview1Screen());
     Navigator.push(context, route);
   ```
  > Nota: Navigator no puede navegar a una ruta que no exista

## AppRouter

1. Centralizar las rutas en `lib/router/app_router.dart`:
   ```Dart

   ```
