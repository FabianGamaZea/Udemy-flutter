import 'package:flutter/material.dart';

class Test_tabla extends StatefulWidget {
  const Test_tabla({super.key});

  @override
  State<Test_tabla> createState() => _Test_tabla();
}

class _Test_tabla extends State<Test_tabla> {
  List<List<int>> matriz = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ];
  void CrearRow() {
    this.matriz = [
      [44,44, 44],
      [33, 33, 33],
      [77, 77, 7]
    ];
    //setState(() {});
    for (int i = 0; i < matriz.length; i++) {
      for (int j = 0; j < matriz[i].length; j++) {
        print(matriz[i][j]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Tabla')),

          //elevation: 10.0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Consula",
                style: TextStyle(fontSize: 20),
              ),
              DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Name',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Age',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Role',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows:  <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text(matriz[0][0].toString())),
                      DataCell(Text('19')),
                      DataCell(Text('Student')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Janine')),
                      DataCell(Text('43')),
                      DataCell(Text('Professor')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('William')),
                      DataCell(Text('27')),
                      DataCell(Text('Associate Professor')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah')),
                      DataCell(Text('19')),
                      DataCell(Text('Student')),
                    ],
                  ),
                ],
              ),
            FloatingActionButton(
          onPressed: () => CrearRow(),
          child: const Icon(Icons.exposure_plus_1_rounded),
        ),
            ],
          ),
        ))

        //),
        );
  }
}
