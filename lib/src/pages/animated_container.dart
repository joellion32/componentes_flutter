import 'dart:math';

import 'package:flutter/material.dart';


class YellowBird extends StatefulWidget {
  const YellowBird({ Key key }) : super(key: key);

  @override
  _YellowBirdState createState() => _YellowBirdState();
}

class _YellowBirdState extends State<YellowBird> {
 double _width = 50.0;
 double _height = 50.0;
 Color _color = Colors.pink;

 // para el borde del contanedor
 BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated - Container'), 
      ),
      body: Center(
       child: AnimatedContainer(
         width: _width,
         height: _height,
         duration: Duration( seconds: 1 ),
         curve: Curves.fastOutSlowIn,
         decoration: BoxDecoration(
           borderRadius: _borderRadius,
           color: _color  
         ),
       ), 
      ),
      floatingActionButton: FloatingActionButton(onPressed: _cambiarForma, child: Icon(Icons.play_arrow)),
    );
  }

  _cambiarForma(){
  final ramdom = Random();
 // para cambiar estado de la funcion
  setState(() {
    _width = ramdom.nextInt(300).toDouble();
    _height = ramdom.nextInt(300).toDouble();
    _color = Color.fromRGBO(
      ramdom.nextInt(255), 
      ramdom.nextInt(255), 
      ramdom.nextInt(255),
      1);

    _borderRadius = BorderRadius.circular(ramdom.nextInt(300).toDouble());
   });
  }

 
  
}