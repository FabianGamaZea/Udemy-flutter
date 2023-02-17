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
      [44, 44, 44],
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
  
          centerTitle: true, // centra el título
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
              onPressed: CrearRow,
              icon: const Icon(Icons.arrow_back),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // centra el ícono
                children: [Icon(Icons.app_settings_alt_sharp), Text("PMN")],
              ),
              IconButton(
              onPressed: CrearRow,
              icon: const Icon(Icons.refresh),
              ),
            ],
          ),
           backgroundColor: const Color.fromARGB(255, 1, 88, 79),
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
              Expanded(
                child: SingleChildScrollView(
                  child: DataTable(
                    //dataTextStyle: const TextStyle(fontSize:.5) ,
                      //headingRowHeight: 0.2,
                      //dataTextStyle: TextStyle(fontSize: 1),
                       


                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Mes',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Ade..',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Vig..',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Rec..',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Car. Ven.',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells:const <DataCell>[
                          DataCell(Text("Enero")),
                          DataCell(Text('19')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Febre')),
                          DataCell(Text('3')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Marzo')),
                          DataCell(Text('27')),
                          DataCell(Text('1 1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Abril')),
                          DataCell(Text('19')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Mayo')),
                          DataCell(Text('19')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Junio')),
                          DataCell(Text('43')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Julio')),
                          DataCell(Text('27')),
                          DataCell(Text('1 1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Agost')),
                          DataCell(Text('19')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Septi')),
                          DataCell(Text('43')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Octub')),
                          DataCell(Text('27')),
                          DataCell(Text('1 1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Novie')),
                          DataCell(Text('19')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Dicie')),
                          DataCell(Text('19')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('19')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              //   FloatingActionButton(
              //     onPressed: () => CrearRow(),
              //     child: const Icon(Icons.refresh),
              //   )
              // ])

            ],
          ),
        ))

        //),
        );
  }
}
