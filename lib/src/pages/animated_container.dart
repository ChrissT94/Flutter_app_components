import 'dart:math';

import 'package:flutter/material.dart';


class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {

  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.red;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _heigth,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _color
          ),
          duration: Duration(seconds:  1),
          curve: Curves.fastOutSlowIn,
        ),
      ),

floatingActionButton:  FloatingActionButton(
  onPressed:  _cambiarEstado,
  child: Icon(Icons.play_arrow),
  ),

    );
  }

  void _cambiarEstado(){
    final ramdom = Random();
    setState(() {
      _width = ramdom.nextInt(300).toDouble();
      _heigth = ramdom.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        ramdom.nextInt(255),
        ramdom.nextInt(255),
        ramdom.nextInt(255),
        1
         );
         _borderRadius = BorderRadius.circular(ramdom.nextInt(100).toDouble());
    });
  }
}