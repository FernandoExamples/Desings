import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[

          _createPage1(),
          _createPage2(),
        ],
      ),
    );
  }

  Widget _createPage1() {
    return Stack(
      children: <Widget>[
        _backgroundColor(),
        _backgroundImage(),
        _createTexts(),
      ],
    );
  }

  Widget _backgroundColor(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _backgroundImage(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createTexts(){
    var textStyle = TextStyle(color: Colors.white, fontSize: 50.0);

    var column =  Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Text('11°', style: textStyle),
        Text('Miercoles', style: textStyle),
        Expanded(child: Container()),
        Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white),
      ],
    );

    return SafeArea(child: column);
  }


  Widget _createPage2() {
    var textStyle = TextStyle(color: Colors.white, fontSize: 20.0);

    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
            child: Text('Bienvenidos', style: textStyle),
          ),
          shape: StadiumBorder(),
          color: Colors.blue,
          onPressed: (){},
        ),
      ),
    );
  }
}
