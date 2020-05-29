import 'package:flutter/material.dart';


class CardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Card Page'),
      ),
      body: ListView(
      padding: EdgeInsets.all(20),
       children: <Widget>[
         _cardTipo1(),
         SizedBox( height: 30.0),
         _cardTipo2()
       ],
      ),
    );
  }


  Widget _cardTipo1(){

    return Card(
       // bordes de la tarjeta
    elevation: 10.0,
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),

     child: Column(
     children: <Widget>[
       ListTile(
        leading: Icon(Icons.photo_album, color: Colors.blue),
        title: Text('Soy el titulo de esta targeta'),
        subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry'),
       ),
       // para los botones
       Row(
         children: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {},
            ),
           
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {},
            )
         ],)
     ],
     ),
    );
  }


Widget _cardTipo2(){
  return Card(
    child: Column(
       children: <Widget>[
         FadeInImage(
          placeholder: AssetImage('assets/original.gif'), 
          image: NetworkImage('https://wallpaperaccess.com/full/959294.jpg'),
          fadeInDuration: Duration( milliseconds: 200 ),
          height: 250.0,
          fit: BoxFit.cover,
         ),
         Container(
           padding: EdgeInsets.all(10.0),
           child: Text('Hola Mundo'),
         )
       ],  
    ) 
  );


}



} // cierre de la clase



