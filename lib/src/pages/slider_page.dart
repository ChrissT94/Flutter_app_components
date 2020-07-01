import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 250.0;
  bool _bloquearCheck = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silder'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _llamarSlider(),
            Text('Check Normal'),
            _llanarCheck(),
            _llanarCheckListTitle(),
            _llanarSwitchListTitle(),
            Expanded(child: _llamarImage()),
          ],
        ),
      ),
    );
  }

  Widget _llamarSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la Imagen',
        value: _valorSlider,
        min: 10.0,
        max: 400.0,
        onChanged: (_bloquearCheck) ? null : (valor) {
          setState(() {
            _valorSlider = valor;
            print(valor);
          });
        });
  }

  Widget _llanarCheck(){
    return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
        _bloquearCheck = valor;
          
        });
      }
      );
  
  }

  Widget _llanarCheckListTitle(){
    return CheckboxListTile(
      title: Text('Activar/desactivar Slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
        _bloquearCheck = valor;
          
        });
      }
      );
  }

  Widget _llanarSwitchListTitle(){
    return SwitchListTile(
      title: Text('Activar/desactivar Slider'),
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
        _bloquearCheck = valor;
          
        });
      }
      );
  }

  Widget _llamarImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/wait_image.gif'),
      image: NetworkImage(
          'https://4.bp.blogspot.com/-csZtjcWAvrM/TeQKL9UmWQI/AAAAAAAAAdU/ZxhCVD7QZSg/s1600/spiderman1.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }



}
