
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(MyApp());



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
   // ... app-specific localization delegate[s] here
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,
 ],
 supportedLocales: [
    const Locale('en'), // English
    const Locale('es'), // Spanish
  ],

      title: 'Aplicacion componentes',
     // home: HomePage(),
      // router
      initialRoute: '/',

      routes: {
      '/': (context) => HomePage(),
      'alert': (context) => AlertPage(),
      'avatar': (context) => AvatarPage(),
      'card': (context) => CardPage(),
      'container': (context) => YellowBird(),
      'inputs': (context) => InputPage(),
      'slider': (context) => SliderPage(),
      'lista': (context) => ListaPage(),
      },
    );
  }
}
 
