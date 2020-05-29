import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  // contructor 
  _MenuProvider(){
    //cargarData();
  }


// retornar la funcion en una promesa
  Future<List<dynamic>> cargarData() async {

// funcion asincrona para cargar la data
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];


    return opciones;
  }
}


// exportar clase
final menuProvider = new _MenuProvider();