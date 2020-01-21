import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {

  TextStyle titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  TextStyle subtitleStyle = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createBody(),
    );
  }

  Widget _createBody(){
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          _createImage(),
          _createName(),
          SizedBox(height: 5.0,),
          _createActions(),
          _createText(),
          _createText(),
          _createText(),
          SizedBox(height: 30.0,)
        ],
      ),
    );
  }

  Widget _createImage(){
    return Image(
          image: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&w=1000&q=80'),
    );
  }

  Widget _createName(){
    var container =  Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),

      child: Row(
        children: <Widget>[

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Lago con piedras', style: titleStyle),
                SizedBox(height: 7.0),
                Text('Un lago en Alemania', style: subtitleStyle),
              ],
            ),
          ),

          Icon(Icons.star, color: Colors.red),
          Text('41'),
        ],
      ),
    );

    return SafeArea(
      child: container,
    );
  }

  Widget _createActions(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _createActionButton(Icons.call, 'CALL'),
        _createActionButton(Icons.near_me, 'ROUTE'),
        _createActionButton(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _createActionButton(IconData icon, String text){
    var textStyle = TextStyle(fontSize: 15.0, color: Colors.blue);
    return Column(
      children: <Widget>[
        IconButton(icon: Icon(icon), color: Colors.blue, onPressed: (){}),
        Text(text, style: textStyle),
      ],
    );
  }

  Widget _createText(){
    var text =  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
              'Ut mollit mollit aute nulla culpa. Reprehenderit exercitation officia labore sit voluptate ad minim pariatur officia sit veniam. Eiusmod consectetur sunt incididunt cupidatat irure commodo. Quis sint id laboris'
              +' nostrud mollit. Officia aute non ad laborum incididunt aute qui.',
              textAlign: TextAlign.justify,
            ),
    );

    return SafeArea(child: text);
  }
}