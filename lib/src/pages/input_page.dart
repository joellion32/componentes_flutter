import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
// variables
var _nombre = "";
var _email = "";
var _password = "";
var _fecha = "";
var opcionSelecionada = 'Volar';

List<String> _poderes = ['Volar', 'Rayolaser', 'SuperFuerza', 'SuperAliento'];

// controlador para poder poner valores dentro de los campos de texto y poder manejar propiedades del input
TextEditingController _inputFieldDateController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page')
      ),
      body: ListView(
      padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0 ),
      children: <Widget>[
        _crearInput(),
         Divider(),
        _crearEmail(),
        Divider(),
        _crearPassword(),
        Divider(),
        _crearFecha(context),
        Divider(),
        _crearDropdown(),
        Divider(),
        _crearPersona()
       
      ],
      )
    );
  }
// input nombre
   Widget _crearInput(){

          return TextField(
           // autofocus: true,
           textCapitalization: TextCapitalization.sentences,
           decoration: InputDecoration(
            // border para el input
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20.0) 
            ), 
            counter: Text('letras ${ _nombre.length }'),
            hintText: 'Nombre de la persona',
            labelText: 'Nombre',
            helperText: 'Solo es el nombre',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.supervised_user_circle)
           ),
           onChanged: (value){
             setState(() {
                _nombre = value;
             });
           } 
     );
   }

// input email
  Widget _crearEmail(){
    return TextField(
      // para poner de que tipo sera el input
      keyboardType: TextInputType.emailAddress,
      // estilos
       decoration: InputDecoration(
            // border para el input
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20.0) 
            ), 
            counter: Text('letras ${ _email.length }'),
            hintText: 'Email de la persona',
            labelText: 'Email',
            helperText: 'Solo es el email',
            suffixIcon: Icon(Icons.email),
            icon: Icon(Icons.alternate_email
           ),
    ),
    onChanged: (value){
      setState(() {
        _email = value;
      });
    },
    );
  }

// input password
  Widget _crearPassword(){
    return TextField(
      // para poner el input tipo password
      obscureText: true,
      decoration: InputDecoration(
         // border para el input
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20.0) 
            ), 
            
            counter: Text('letras ${ _password.length }'),
            hintText: 'Password de la persona',
            labelText: 'Password',
            helperText: 'Solo es el password',
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.lock_outline ),
        ),
        onChanged: (value){
         setState(() {
            _password = value;
         });
        },
    );
  }

  // input crear fecha
  Widget _crearFecha(BuildContext context){
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        // border para el input
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20.0) 
            ), 
          hintText: 'Fecha de Nacimiento',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.calendar_today),
          icon: Icon(Icons.calendar_today )
      ),
      // para cuando el input sea tocado salga el datepicker
      onTap: (){
        FocusScope.of(context).requestFocus( new FocusNode());
        _selectDate(context);
      },
    );
  }


// crear dropdowm
  _crearDropdown(){
    return DropdownButton(
      value: opcionSelecionada,
      items: getOpciones(),
      onChanged: (opt){
        opcionSelecionada = opt;
      },
    );
  }


  //***--------funciones personalizadas------------ *//

// ejecutar datepicker
   _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List <DropdownMenuItem<String>> getOpciones() {

    List <DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) { 
      lista.add(
        DropdownMenuItem(
          child: Text(poder),
          value: poder,
        )
      );
    });

    return lista;

  }




    // para escribir el valor de la variabel en un widget text
   Widget _crearPersona(){
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('Email es $_email'),
      trailing: Text('$opcionSelecionada'),
    );
   }
}