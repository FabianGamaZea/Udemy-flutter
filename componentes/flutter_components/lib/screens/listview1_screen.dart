import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final opcions = const [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
  ];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Listview Top 1")),
        ),
        body: ListView(children: [
          ...opcions.map(
            (game) => ListTile(
              title: Text(game),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            )
            
          )
        ]));
  }
}
