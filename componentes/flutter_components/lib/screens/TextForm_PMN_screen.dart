import 'package:flutter/material.dart';

const List<String> list = <String>["Aguascalientes", "Cancun", "Chihuahua", "Congreso", "Digital", "Durango", "Hermosillo", "Jalisco", "Juarez", "Leon", "Merida", "Monterrey", "Morelia", "Puebla", "Queretaro", "Tijuana", "Toluca", "Veracruz", "Villahermosa", "World Trade Center", "Zacatecas"];

class FormPMNScreen extends StatelessWidget {
  const FormPMNScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: Row(
                children: [
            
                  
                  const SizedBox(width: 36),
                  const DropdownButtonExample(),
                  const SizedBox(width: 36),
                  Expanded(
                      child: Container(
                    child: TextFormField(
                      autofocus: true,
                      //initialValue: '2000',
                      //textCapitalization: TextCapitalization.,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null) return "Año vacio";
                        return value.length != 4 ? "Año invalido" : null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 4,
                    ),
                  )),
                  const SizedBox(width: 36),
                  
                ],
              ),
              
            ),
            
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.subdirectory_arrow_right_outlined),
        onPressed: () {
          
            print("hola");
          

         },
       ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


