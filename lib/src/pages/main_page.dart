import 'package:desings/src/pages/basic_page.dart';
import 'package:desings/src/pages/buttons_page.dart';
import 'package:desings/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return PageView(
         children: <Widget>[
           BasicPage(),
           ScrollPage(),
           ButtonsPage(),
         ],
      );
  }
}