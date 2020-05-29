import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aplicacion de componentes'),
      ),
      body: _lista(),
    );
  }

// Widget personalizado 
  Widget _lista(){

    // FutureBuilder para preparar la data y poner controlar el tiempo de carga
 return FutureBuilder(
   future: menuProvider.cargarData(),
   initialData: [],
   builder: (context, AsyncSnapshot<List<dynamic>> snapshot ){
     return ListView(
      children: _crearlista(snapshot.data, context)
    ); 
   },
   );
  }


 List<Widget> _crearlista(List<dynamic> data, context){
    final List<Widget> opciones = [];

    data.forEach((opt) {
     final widgetTemp = ListTile(
       title: Text(opt['texto']),
       leading: Icon(Icons.account_circle, color: Colors.blue),
       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
       onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
       },
     );
     opciones.add(widgetTemp);
     opciones.add(Divider());
     
    });

    return opciones;
}
}