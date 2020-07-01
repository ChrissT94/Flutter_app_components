import 'package:flutter/material.dart';

import 'package:componentes_app/src/providers/menu_provider.dart';
import 'package:componentes_app/src/utils/icono_string_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

// Crear el Widget
  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
   
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> lista = [];

    data.forEach((opciones) {
      final addData = ListTile(
        leading: getIcon(opciones['icon']),
        title: Text(opciones['texto']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: () {

         Navigator.pushNamed(context, opciones['ruta']);
        },
      );
      lista..add(addData)..add(Divider());
    });

    return lista;
  }
}
