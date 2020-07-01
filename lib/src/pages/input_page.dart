import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  TextEditingController _inputFieldDateController =
  new TextEditingController();
  List<String> _poder = ['Volar', 'Rayos X', 'Aliento', 'Chriss'];
  String _opcionSelecionada = 'Volar';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _llamarTextField(),
          Divider(),
          _llamarTextFieldEmail(),
          Divider(),         
          _llamarTextFieldPassword(),
          Divider(),
          _llamarTextFieldDatePicker(),
          Divider(),
          _llamarDropdownManuItem(),
          Divider(),

          ListTile(
            title: Text('Nombres'),
            subtitle: Text(_nombre),
            trailing:  Text('Poder $_opcionSelecionada'),
          ),
          Divider(),

        ],
      ),
    );
  }

Widget _llamarTextField(){
  return TextField(
    autofocus: true,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      counter: Text('Letras ${_nombre.length}'),
      hintText: 'nombres',
      labelText: 'Nombres:',
      helperText: 'Solo nombres',
      suffixIcon: Icon(Icons.accessibility),
      icon: Icon(Icons.account_circle),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      )
    ),
    onChanged: (valor){
      setState(() {
        _nombre = valor;
        print(_nombre);
      });
    },
    
  );
}

Widget _llamarTextFieldEmail(){

  return TextField(
    autofocus: true,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: 'email',
      labelText: 'Email:',
      suffixIcon: Icon(Icons.alternate_email),
      icon: Icon(Icons.email),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      )
    ),
    onChanged: (valor){
      setState(() {
        _email = valor;
        print(_email);
      });
    },
    
  );
}

Widget _llamarTextFieldPassword(){
  return TextField(
    autofocus: true,
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'password',
      labelText: 'Password:',
      suffixIcon: Icon(Icons.lock_open),
      icon: Icon(Icons.lock),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      )
    ),
    onChanged: (valor){
      setState(() {
        _password = valor;
        print(_password);
      });
    },
    
  );
}

Widget _llamarTextFieldDatePicker(){
  return TextField(
    controller: _inputFieldDateController,
    enableInteractiveSelection: false,
    decoration: InputDecoration(
      hintText: 'Fecha de Nacimiento',
      labelText: 'Fecha de Nacimiento',
      suffixIcon: Icon(Icons.perm_contact_calendar),
      icon: Icon(Icons.calendar_today),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)
      )
    ),
    onTap: (){
      FocusScope.of(context).requestFocus(new FocusNode());
      _selectDate(context);
    },
    
  );
}

Widget _llamarDropdownManuItem(){

  return Row(
    children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      DropdownButton(
        value: _opcionSelecionada,
        items: _getOpcionesDrop(),
        onChanged: (opt){          
          setState(() {
          _opcionSelecionada = opt;            
          });
        },
        ),
    ],
  );

}

List<DropdownMenuItem<String>> _getOpcionesDrop(){

  List<DropdownMenuItem<String>> lista = new List();
  _poder.forEach((poder){
    lista.add(DropdownMenuItem(
      child: Text(poder),
      value: poder,
      ));
  });

  return lista;

}

void _selectDate(BuildContext context) async {
  DateTime picked = await showDatePicker(
    context: context, 
    initialDate: new DateTime.now(), 
    firstDate: new DateTime(2015),
    lastDate: new DateTime(2025),
    locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
}

}