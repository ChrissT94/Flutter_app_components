import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(children: _addItemsLargo()),
    );
  }

  // Método largo agregar items a la Lista.

  List<Widget> _addItems() {
    List<Widget> lista = new List();

    for (var item in opciones) {
      final list = ListTile(
        title: Text(item),
      );

      lista.add(list);
      lista.add(Divider());
    }
    return lista;
  }

// Método corto agregar items a la Lista.

  List<Widget> _addItemsLargo() {
    return opciones.map((data) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(data),
            leading: Icon(Icons.accessibility_new),
            trailing: Icon(Icons.chevron_right),
            onTap: (){
              
            },
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
