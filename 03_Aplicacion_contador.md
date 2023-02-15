# Aplicacion Contador
## Widget
+ [MaterialApp](https://api.flutter.dev/flutter/material/MaterialApp-class.html)
+ [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
+ [StatelessWidget](https://api.flutter.dev/flutter/widgets/StatelessWidget-class.html)

```Dart
import 'package:flutter/material.dart';

void main() {
 runApp( const MyApp()) ;
}

class MyApp extends StatelessWidget {    //La clase extiende de Widget
  const MyApp({super.key});

  @override                              //Necesario para Widget
  Widget build(BuildContext context) {   //Construccion de eventos dentro del Widget
   
   return const MaterialApp(
    home: Center(
      child: Text('Hola Mundo')
      ),
   );
  }
}
```
## Prefer const 
Considera que las clases delacradas que no van a tener cambios se declaren como contantes para mayor optimizacion .

+ Ejemplo:
   ```Dart
   ...
      return const MaterialApp(
       home: Center(
       child: Text('Hola Mundo')
       ),
     );
   ...
   ```

## Separar lógica de archivos 
1. ventanas en: `/lib/screen`
2. numbre de ventanas: `home_sreen.dart`
3. establecer un widget independiente:
   + `/lib/screen/home_screen.dart`
     ```Dart
     import 'package:flutter/material.dart';

     class homeScreen extends StatelessWidget{
     const homeScreen({super.key});

     @override
     Widget build(BuildContext context) {
     return const Center(
      child: Text('homeScreen')
         );
       }
     }   
     ```
   + `/lib/main.dart`:

        ```Dart
        import 'package:flutter/material.dart';
        import 'package:test_app/screen/home_screen.dart';
        
        void main() {
         runApp( const MyApp()) ;
        }
        
        class MyApp extends StatelessWidget {
          const MyApp({super.key});
        
          @override
          Widget build(BuildContext context) {
           
           return const MaterialApp(
            debugShowCheckedModeBanner: false,      //Desaparece la etiqueta debug
            home: homeScreen()
           );
          }  
        }
        ```
  > Separa el Widget del main

## BuildContext y Scaffold
+ [Scraffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) es como un lienzo para poder colocar los widgets
   + tiene necesariamente un `body:`
     ```Dart
     ...
     Widget build(BuildContext context) {
     return Scaffold(
     budy: ... ,
     ),
     ...
     ```
+ BuildContext es el arbol de widgets
   + Conoce la informacion de la decendencia 
   + Conocer el contexto en el que está construido el widget
   + Mantiene el camino de las referencias hasta el punto en donde se invoca 
   > Nota: se musta el icono en una lupa con el logo de flutter en el Debuggin

## Columnas
+ [Basic widgets](https://docs.flutter.dev/development/ui/widgets/basics)
   + [Columnas](https://docs.flutter.dev/development/ui/widgets/basics)
     + Ejempo:
     el mainAxisAlignment centra verticalmente y el center que lo envuelve centra horizontalmente en el Widget se muentran los textos **"Número de clicks"** y el **"0"** centrados

       `/lib/screens/horizontalmente.datr`
       ```Dart
       import 'package:flutter/material.dart';
       
       class homeScreen extends StatelessWidget {
         const homeScreen({super.key});
       
         @override
         Widget build(BuildContext context) {
           return Scaffold(
             appBar: AppBar(
               title: const Text('homeScreen'),
               //elevation: 10.0,
             ),
             backgroundColor: Colors.white,
             body: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: const <Widget>[
               Text('Número de clicks'),
               Text('0'),
                 ],
               ),
             ),
           );
         }
       }
       ```
   + [Appbar](https://api.flutter.dev/flutter/material/AppBar-class.html)
     + Ejemplo:
       `/lib/screen/home_screen.dart`
       ```Dart
       import 'package:flutter/material.dart';
       
       class homeScreen extends StatelessWidget {
         const homeScreen({super.key});
       
         @override
         Widget build(BuildContext context) {
           return Scaffold(
             appBar: AppBar(
               title: const Text('homeScreen'),
               elevation: 10.0,
             ),
             backgroundColor: Colors.white,
             body: const Center(child: Text('homeScreen')),
           );
         }
       }
       
       ```
## Estilos de textos 
+ fontsize
   ```Dart
   ...
   Text('Número de clicks',style: TextStyle(fontSize: 20),),
   ...
   ```
##  Botón flotante
+ FloatingActionButton
   ```Dart
   ...
   floatingActionButton: FloatingActionButton(
     onPressed: () {
       print("hola mundo");
     },
   ),
   ...
   ```
+ Styles
   + [Material icons](https://fonts.google.com/icons?selected=Material+Icons)
   + Añadir icono
     ```Dart 
     floatingActionButton: FloatingActionButton(
     child: const Icon(Icons.add),      //icon. muesta los dif iconos
     onPressed: () {
       print("hola mundo");
      },
     ),
     ```
     > icon(): es un Widget especializado en mostrar icomos
+ Cambiar ubicacion del botton
   ```Dart
   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
   ```

## StatelessWidget
las variables mostradas no aceptan cambios
> Nota: Se recomienda utilizar siempre el StatelessWidget, si se requiere un cambio, entonces es necesario transformar la clase en un StatefulWidget

##  StatefulWidget
para mostrar variables es necesario tener un gestor de estados en un StatefulWidget
```Dart
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() =>
      _CounterScreenState(); //Sobre escritura de la creacion del estado
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0; //Se asigna como propiedad

  @override
  Widget build(BuildContext context) {
    var sizeText = const TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),

        //elevation: 10.0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Número de clicks', style: sizeText),
            Text('$counter', style: sizeText),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ++counter;
          setState(() {});  //Funcion anonima, actualiza los cambios del estado de cambio de los objetos
        },
      ),
    );
  }
}
```

## Optimizar código

+ Inicial:
   ```Dart
   import 'package:flutter/material.dart';
   
   class CounterScreen extends StatefulWidget {
     const CounterScreen({super.key});
   
     @override
     State<CounterScreen> createState() =>
         _CounterScreenState(); //Sobre escritura de la creacion del estado
   }
   
   class _CounterScreenState extends State<CounterScreen> {
     int counter = 0; //Se asigna como propiedad
   
     @override
     Widget build(BuildContext context) {
       var sizeText = const TextStyle(fontSize: 30);
       var space = const SizedBox(width: 20);
   
       return Scaffold(
         appBar: AppBar(
           title: const Center(child: Text('Counter Screen')),
   
           //elevation: 10.0,
         ),
         backgroundColor: Colors.white,
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text('Número de clicks', style: sizeText),
               Text('$counter', style: sizeText),
             ],
           ),
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
         floatingActionButton: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             
             FloatingActionButton(
               child: const Icon(Icons.exposure_plus_1_rounded),
               onPressed: () {
                 ++counter;
                 setState(() {});  //Funcion anonima, actualiza los cambios del estado de cambio de los objetos
               },
             ),
   
              FloatingActionButton(
               child: const Icon(Icons.restart_alt),
               onPressed: () {
                 counter = 0;
                 setState(() {});  //Funcion anonima, actualiza los cambios del estado de cambio de los objetos
               },
             ),
   
             FloatingActionButton(
               child: const Icon(Icons.exposure_minus_1),
               onPressed: () {
                 --counter;
                 setState(() {});  //Funcion anonima, actualiza los cambios del estado de cambio de los objetos
               },
             ),
           ],
         ),
       );
     }
   }
   ```
+ Optimizado 
   el codigo tambien envia funciones como argumentos 
   ```Dart
   import 'package:flutter/material.dart';
   
   class CounterScreen extends StatefulWidget {
     const CounterScreen({super.key});
   
     @override
     State<CounterScreen> createState() =>
         _CounterScreenState(); //Sobre escritura de la creacion del estado
   }
   
   class _CounterScreenState extends State<CounterScreen> {
     int counter = 0; //Se asigna como propiedad
     void increase() {
       counter++;
       setState(() {});
     }
     void reset(){
       counter = 0;
       setState(() {});
     }
     void decrease(){
       counter--;
       setState(() {});
     }
   
   
     @override
     Widget build(BuildContext context) {
       var sizeText = const TextStyle(fontSize: 30);
       var space = const SizedBox(width: 20);
   
       return Scaffold(
         appBar: AppBar(
           title: const Center(child: Text('Counter Screen')),
   
           //elevation: 10.0,
         ),
         backgroundColor: Colors.white,
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text('Número de clicks', style: sizeText),
               Text('$counter', style: sizeText),
             ],
           ),
         ),
         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
         floatingActionButton: CustomFlotingActions(increaseFn: increase, decreaseFn: decrease, resetFn: reset,),
       );
     }
   }
   
   class CustomFlotingActions extends StatelessWidget {
     final Function increaseFn;
     final Function decreaseFn;
     final Function resetFn;
     
     const CustomFlotingActions({
       super.key, required this.increaseFn, required this.decreaseFn, required this.resetFn,
     });
   
     @override
     Widget build(BuildContext context) {
       return Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           FloatingActionButton(
             onPressed: () => increaseFn(),
             child: const Icon(Icons.exposure_plus_1_rounded),
           ),
   
           FloatingActionButton(
             onPressed: () => resetFn(),
             child: const Icon(Icons.restart_alt),
           ),
   
           FloatingActionButton(
             onPressed: () => decreaseFn(),
             child: const Icon(Icons.exposure_minus_1),
           ),
         ],
       );
     }
   }
   
   ```
