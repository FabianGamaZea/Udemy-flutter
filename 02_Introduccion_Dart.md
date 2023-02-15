# Hola Mundo en Dart

```Dart
void main() {
  
  // Este es un comentario
  
  /*
   *  Esto es un comentario multilinea
   *  Hola de nuevo...
   */
  
  
  print('Hola Mundo');
  
}
```
# Tipos de datos 
```Dart

void main()  {
  
//   Strings 
  final String nombre = 'Tony';
  final apellido = 'Stark';

//  Constante
  const edad = 3;
  
//nombre = 'Peter';
  
//templet string
  print('$nombre $apellido');
  
  
//   Números
  int empleados = 10;
  double salario = 1856.25;
  
  print( empleados );
  print( salario );

//   Booleanos
 bool? isActive = null;
  
  //negacion !isActive
  if ( isActive == null ) {
    print( 'isActive es null' );
  } else {
    print( 'No es null' );
  }
  
//   Listas
//List? numeros = null;    puede inicializarce con valore nulos
  List<int> numeros = [1,2,3,4,5,6,7,8,9,10];
  numeros.add(11);
  print( numeros );
  
  final masNumeros = List.generate(100, (int index) => index );
 
  print(masNumeros);


//   Map
//   Map persona = {
//     'nombre': 'Fernando',
//     'edad': 35,
//     'soltero': false,
//     true: false,
//     1: 100,
//     2: 500
//   };
  
  Map<String, dynamic> persona = {
    'nombre': 'Fernando',
    'edad': 35,
    'soltero': false,
  };
  
  persona.addAll({ 'segundoNombre': 'Juan' });
  
  print( persona );

  
}


```
# Funciones 
```Dart
void main() {
  
  final nombre = 'Fernando';
  
//   saludar( nombre, 'Greetings' );
  saludar2( nombre: nombre, mensaje: 'Greetings' );
  
}

void saludar( String nombre, [ String mensaje = 'Hi' ]) {
  print('$mensaje $nombre');
}


void saludar2({ 
  required String nombre, 
  required String mensaje,
 }) {
  print('$mensaje $nombre');
}
```
# Clases
```Dart
void main(){
  
  final wolverine = new Heroe(nombre:'Logan', poder: 'Regeneración');
  
//   wolverine.nombre = 'Logan';
//   wolverine.poder = 'Regeneración';
  
  print( wolverine );
  
}


class Heroe {
  
  String nombre;
  String poder;
  
  Heroe({ 
    required this.nombre, 
    required this.poder 
  });
  
//   Heroe( String pNombre ) {
//     this.nombre = pNombre;
//   }
  
  
  String toString() {
    return 'Heroe: nombre: ${this.nombre}, poder: ${ this.poder }';
  }
}
```
## Constructor con nombres
```Dart
void main(){
  
  final rawJson = {
    'nombre': 'Tony Stark',
    'poder': 'Dinero'
  };
  
//   final ironman = new Heroe( nombre: rawJson['nombre']!, poder: rawJson['poder']! );
  
   final ironman = Heroe.fromJson( rawJson );
  
  print(ironman);
  
//   final wolverine = new Heroe(nombre:'Logan', poder: 'Regeneración');
//   print( wolverine );
  
}


class Heroe {
  
  String nombre;
  String poder;
  
  Heroe({ 
    required this.nombre, 
    required this.poder 
  });
  
  Heroe.fromJson( Map<String, String> json  ):
    this.nombre = json['nombre']!,
    this.poder  = json['poder'] ?? 'No tiene poder';
  
  
  
  String toString() {
    return 'Heroe: nombre: ${this.nombre}, poder: ${ this.poder }';
  }
}
Give feedback

```
## Getters and Setters
```Dart
import 'dart:math' as math;

void main() {
  
  final cuadrado = new Cuadrado( 2 );
  
  cuadrado.area = 100;
  
  print( 'area: ${ cuadrado.calculaArea() }' );
  
  print( 'lado: ${ cuadrado.lado }' );
  print( 'area get: ${ cuadrado.area }' );
  
  
  
}


class Cuadrado {
  
  double lado;  // lado * lado
   
  
  double get area {
    return this.lado * this.lado;
  }
  
  set area( double valor ) {
    this.lado = math.sqrt(valor);
  }
  
  
  
  Cuadrado( double lado ):
    this.lado = lado;
  
  double calculaArea() {
    return this.lado * this.lado;
  }
}
```

## Clases abstractas
```Dart
void main() {
  
  final perro = new Perro();
  final gato = new Gato();
 
  
  sonidoAnimal( perro );
  sonidoAnimal( gato );
  
}

void sonidoAnimal( Animal animal ) {
  animal.emitirSonido();
}


abstract class Animal {
  
  int? patas;
  void emitirSonido();
  
}

class Perro implements Animal {
  
  int? patas;
  
  void emitirSonido() => print('Guauuuuuuuu');
  
}

class Gato implements Animal {
  
  int? patas;
  int? cola;
  
  void emitirSonido() => print('Miauuuuuuuu');
}

```
## Extends 
```Dart
void main() {
    
  final superman = new Heroe('Clark Kent');
  final luthor   = new Villano('Lex Luthor');
 
  
  print( superman );
  print( luthor );
}


abstract class Personaje {
  String? poder;
  String nombre;
  
  Personaje( this.nombre );
  
  @override
  String toString() {
    return '$nombre - $poder';
  }
  
}


class Heroe extends Personaje {
 
   int valentia = 100;
  
   Heroe( String nombre ): super( nombre );
  
}

class Villano extends Personaje {
  
  int maldad = 50;
  
  Villano( String nombre ): super( nombre );
}


```

# Mixins
[¿Qué son los mixins?](https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3)

```Dart
abstract class Animal { }

abstract class Mamifero extends Animal { }
abstract class Ave extends Animal { }
abstract class Pez extends Animal { }

abstract class Volador {
  void volar() => print('estoy volando');
}

abstract class Caminante {
  void caminar() => print('estoy caminando');
}

abstract class Nadador {
  void nadar() => print('estoy nadando');
}

class Delfin extends Mamifero with Nadador{}

class Murcielago extends Mamifero with Caminante, Volador {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}

class Pato extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Nadador, Volador {}


void main() {
  
  
//   final flipper = new Delfin();
//   flipper.nadar();
  
//   final batman = new Murcielago();
//   batman.caminar();
//   batman.volar();

}

```
# Futures
```Dart
void main() {
  
  print('Antes de la petición');
  
  httpGet('https://api.nasa.com/aliens')
     .then( (data) {
       
       print( data.toUpperCase() );
       
     });
  
  
  print('Fin del programa');
    
}




Future<String> httpGet( String url ) {
  return Future.delayed( 
    Duration( seconds: 3 ), () =>'Hola Mundo - 3 segundos' 
  );
}
```

# Async - Await
```Dart
void main() async {
  
  print('Antes de la petición');
  
  final data = await httpGet('https://api.nasa.com/aliens');
  
  print( data );
  
//   final nombre = await getNombre( '10' );
//   print( nombre );
//    getNombre( '10' ).then( print );
  
  
  print('Fin del programa');
    
}


Future<String> getNombre( String id ) async {
  return '$id - Fernando';
} 





Future<String> httpGet( String url ) {
  return Future.delayed( 
    Duration( seconds: 3 ), () =>'Hola Mundo - 3 segundos' 
  );
}

```

> [Dartpad](https://dartpad.dartlang.org/?)
