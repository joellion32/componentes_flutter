import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
List<int> _listaNumeros = new List();
int _ultimoItem = 0;

// controlador para controlar el scroll
ScrollController _scrollController = new ScrollController();


// invocar constructor initState
@override
  void initState() {
    super.initState();
      _agregar10();

  // envento que se dispara cada vez que se mueve el scroll
  _scrollController.addListener(() {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      _agregar10();
    }
  });

  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('List View Page'),
      ),
      body: _crearLista(),
    );
  }
  _crearLista(){

    return RefreshIndicator(
    onRefresh: refrescarPagina,  
    child: ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
      final _imagen = _listaNumeros[index];
      return FadeInImage(
      placeholder: AssetImage('assets/original.gif'), 
      image: NetworkImage('https://i.picsum.photos/id/$_imagen/500/300.jpg'),
      fit: BoxFit.cover,
      );
     },
    ),
  );
    
  }


void _agregar10(){
  for (var i = 0; i < 10; i++) {
    _ultimoItem++;
    _listaNumeros.add(_ultimoItem);
  }

  setState(() {
    
  });
}

Future<Null> refrescarPagina() async{
 final duration = new Duration( seconds: 2 );
 await new Timer(duration, (){ 
   _listaNumeros.clear();
   _ultimoItem++;
   _agregar10();
 });

 return Future.delayed(duration);
}


} // cierre de la clase