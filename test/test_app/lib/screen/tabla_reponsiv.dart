import 'package:flutter/material.dart';
class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int _currentPage = 0;
  List<MyData> _data = getData();

  void _handlePageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PaginatedDataTable(
      header: Text('Mi Tabla'),
      columns: [
        DataColumn(label: Text('Columna 1')),
        DataColumn(label: Text('Columna 2')),
        DataColumn(label: Text('Columna 3')),
        DataColumn(label: Text('Columna 4')),
        DataColumn(label: Text('Columna 5')),
      ],
      source: MyDataSource(data: _data),
      onPageChanged: _handlePageChanged,
      rowsPerPage: _rowsPerPage,
      availableRowsPerPage: [10, 20, 50],
      onRowsPerPageChanged: (newRowsPerPage) {
        setState(() {
          _rowsPerPage = newRowsPerPage!;
        });
      },
    );
  }
}

class MyData {
  final String col1;
  final String col2;
  final String col3;
  final String col4;
  final String col5;

  MyData(this.col1, this.col2, this.col3, this.col4, this.col5);
}

class MyDataSource extends DataTableSource {
  final List<MyData> data;

  MyDataSource({required this.data});

  @override
  DataRow getRow(int index) {
    final MyData rowData = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(rowData.col1)),
        DataCell(Text(rowData.col2)),
        DataCell(Text(rowData.col3)),
        DataCell(Text(rowData.col4)),
        DataCell(Text(rowData.col5)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

List<MyData> getData() {

  List<MyData> data = [
    MyData('Valor 1A', 'Valor 1B', 'Valor 1C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 2A', 'Valor 2B', 'Valor 2C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 3A', 'Valor 3B', 'Valor 3C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 4A', 'Valor 4B', 'Valor 4C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 5A', 'Valor 5B', 'Valor 5C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 7A', 'Valor 7B', 'Valor 7C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 8A', 'Valor 8B', 'Valor 8C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 6A', 'Valor 6B', 'Valor 6C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 9A', 'Valor 9B', 'Valor 9C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 10A', 'Valor 10B', 'Valor 10C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 11A', 'Valor 11B', 'Valor 11C', 'Valor 1B', 'Valor 1C'),
    MyData('Valor 12A', 'Valor 12B', 'Valor 12C', 'Valor 1B', 'Valor 1C'),
  ];
  return data;
}
