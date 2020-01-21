import 'package:desings/src/pages/basic_page.dart';
import 'package:desings/src/pages/buttons_page.dart';
import 'package:desings/src/pages/main_page.dart';
import 'package:desings/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    // ));

    return MaterialApp(
      title: 'Desings',
      debugShowCheckedModeBanner: false,
      
      initialRoute: 'main',
      routes: {
        'basic' : (context) => BasicPage(),
        'scroll' : (context) => ScrollPage(),
        'buttons' : (context) => ButtonsPage(),
        'main' : (context) => MainPage(),
      },
      
    );
  }

}