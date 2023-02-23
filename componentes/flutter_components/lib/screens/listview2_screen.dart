import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final opcions = const [
    "Megaman",
    "Metal Gear",
    "Super Smash",
    "Final Fantasy"
  ];

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Listview Top 2")),
          elevation: 0,
          backgroundColor: Colors.indigo[400],
        ),
        body: 
        ListView.separated(
            separatorBuilder: (__, _) => const Divider(),
            itemCount: opcions.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(opcions[index]),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded,color:Colors.indigo),
                  onTap: () {
                    final game = opcions[index];
                    print(game);
                  },
                )));
  }
}
