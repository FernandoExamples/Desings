import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundApp(),

          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _createTitles(),
                _createButtons(),
              ],
            ),
          ),

        ],
      ),

      bottomNavigationBar: _navBarTheme(context),
    );
  }

  Widget _backgroundApp() {

    final gradient = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0),
            ]),
      ),
    );

    final pinkBox = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ]
          ),
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          top: -100.0,
          child: pinkBox
        ),
      ],
    );
  }

  Widget _createTitles(){

    var titleStyle = TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold);
    var subtitleStyle = TextStyle(color: Colors.white, fontSize: 20.0);

    var titles =  Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Classify transaction', style: titleStyle),
          SizedBox(height: 10.0,),
          Text('Classify this transaction into a particular category', style: subtitleStyle),
        ],
      ),
    );

    return SafeArea(child: titles);
  }

  Widget _navBarTheme(BuildContext context){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        ),
      ),
      child: _createBottomNavigation(),
    );
  }

  Widget _createBottomNavigation(){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.calendar_today, size: 30.0),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.pie_chart_outlined, size: 30.0),
        ),
        BottomNavigationBarItem(
          title: Container(),
          icon: Icon(Icons.supervised_user_circle, size: 30.0),
        ),
      ],
    ); 
  }

  Widget _createButtons(){
    return Table(
      children: [

        TableRow(
          children: [
            _createButton(Icons.border_all, 'General', Colors.blue),
            _createButton(Icons.directions_transit, 'Transport', Colors.purpleAccent),
          ]
        ),

        TableRow(
          children: [
            _createButton(Icons.shopping_basket, 'Shopping', Colors.pinkAccent),
            _createButton(Icons.payment, 'Bills', Colors.orange),
          ]
        ),

        TableRow(
          children: [
            _createButton(Icons.ondemand_video, 'Enterteiment', Colors.blue),
            _createButton(Icons.local_grocery_store, 'Grocery', Colors.green),
          ]
        ),


      ],
    );
  }

  Widget _createButton(IconData icon, String text, Color color){
    var button =  Container(
      height: 180.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(62, 66, 107, 0.7),
        borderRadius: BorderRadius.circular(20.0),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          CircleAvatar(
            child: Icon(icon, color: Colors.white, size: 40.0),
            radius: 35.0,
            backgroundColor: color,
          ),
          Text(text, style: TextStyle(color: color, fontSize: 20.0)),
        ],
      ),
    );

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: button,
      ),
    );
  }
}
