import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            'Mostrar Alerta',
            style: TextStyle(fontSize: 20.0),
          ),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () => _llamarAlerta(context),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.fast_rewind),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _llamarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Christian Torres'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Ingeniero en Sistemas Computacionales e Informáticos',
                ),
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK')),
              FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'))
            ],
          );
        });
  }
}
