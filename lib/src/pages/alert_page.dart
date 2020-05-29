import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'), 
      ), 
      body: Center (
          child: RaisedButton(
          child: Text('Hazme Click'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
          
          onPressed: () => _alerta(context)),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add_location),  onPressed: () => Navigator.pop(context)),
    );
  }

  // funcion para llamar la alerta
  void _alerta(BuildContext context){
     showDialog(
      context: context,
      // para que la alerta no se salga para cuando se haga click afuera
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          // bordes de una alerta
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ),
          title: Text('Hola Mundo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Este es el contenido de la alerta'),
              Divider(),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('cancelar')),
            FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text('OK')),
          ],
        );
      },
    );
  }
}