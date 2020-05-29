import 'package:flutter/material.dart';


class AvatarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Avatar Page'),
         actions: <Widget>[
           Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
            backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg'),
            radius: 25.0,
           ),
           ),
           Container(
             margin: EdgeInsets.only(right: 10.0),
             child:  CircleAvatar(
             child: Text('SL', style: TextStyle(color: Colors.white)),
             backgroundColor: Colors.purple,
           ),
           )
         ],
      ), 
      body: Center(
        child: FadeInImage(placeholder: AssetImage('assets/original.gif'), image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/7/7b/Stan_Lee_by_Gage_Skidmore_3.jpg')),
      ),
    );
  }
}