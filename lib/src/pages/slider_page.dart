import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
 double _valorSlider = 100.0;
 bool _blockearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Slider Page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
         children: <Widget>[
           _crearSlider(),
           _vSlider(),
           _checkBox(),
           Expanded(child:  _crearImagen()) 
         ],
        ),
      ),
    );
  }


  Widget _crearSlider(){
    return Slider(
      activeColor: Colors.indigo,
      label: 'Valor del Slider',
      divisions: 20,
      value: _valorSlider, 
      max: 1000.0,
      min: 100.0,
      onChanged: (_blockearCheck) ? null: (valor){
        setState(() {
          _valorSlider = valor;
        });
      });
  }

Widget _vSlider(){
return ListTile(
  title: Text('Valor: ${_valorSlider.toString()}'),
);
}


Widget _crearImagen(){
  return FadeInImage(
    width: _valorSlider,
    fit: BoxFit.contain,
    placeholder: AssetImage('assets/original.gif'), 
    image: NetworkImage('https://cnet1.cbsistatic.com/img/rfzZ-7G32v_qEt2uCD0b4KB2rho=/940x0/2019/03/26/13d0a566-7355-4381-be24-dee281227504/spider-man-far-from-home-promo-image-1.jpg'));
}

Widget _checkBox(){
  return CheckboxListTile(
    title: Text('Blockear Slider'),
    value: _blockearCheck, 
    onChanged: (valor){
     setState(() {
        _blockearCheck = valor;
     });
    });
}

} // cierre de la clase

