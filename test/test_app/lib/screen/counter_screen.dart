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
