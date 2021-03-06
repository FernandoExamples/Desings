import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            _backgroundImage(),
            _createTitle(),
            _body(context),
          ],      
        ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/background.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _createTitle(){
    var titleStyle = TextStyle(fontSize: 40.0, color: Colors.white);

    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('My Account', style: titleStyle)
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: _createLoginCard(context),
          padding: EdgeInsets.all(20.0),
          color: Colors.black45,
        )
      ],
    );
  }

  Widget _createLoginCard(BuildContext context){
    var screen = MediaQuery.of(context).size;

    var card = Card(      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[            

            _createTextField(Icons.person_outline, 'Login'),
            SizedBox(height: 5.0),
            _createSwitch(),
            _createTextField(Icons.lock_outline, 'Password'),
            SizedBox(height: 20.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Forgot Password?'),
              ],
            ),

            SizedBox(height: 30.0),

            MaterialButton(
              minWidth: double.infinity,
              height: 50.0,
              child: Text('Sing in', style: TextStyle(fontSize: 20.0)),
              color: Colors.deepOrange,
              textColor: Colors.white,
              onPressed: (){},
            ),
                        
          ],
        ),
      ),
    );

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
      
        Container(
           padding: EdgeInsets.only(top: 25.0), //top: screen.height * 0.03
           child: card,
           color: Colors.blue,
        ),

       _circleAvatar(context),

      ],
    );
  }

  Widget _createTextField(IconData icon, String prompt){
    return TextField(
      decoration: InputDecoration(
        labelText: prompt,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _createSwitch(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text('Remember me'),
        Switch(
          onChanged: (bool value) {},
          value: false,
        ),
      ],
    );
  }

  Widget _circleAvatar(BuildContext context){
    var screen = MediaQuery.of(context).size;
    var dpi = MediaQuery.of(context).devicePixelRatio;

    print('heith ${screen.height}');
    print('dpi $dpi');

    return CircleAvatar(
        radius: 33.0, //screen.height * 0.0422
        child: Icon(Icons.person, size: 40.0),
        backgroundColor: Color.fromRGBO(22, 29, 79, 1.0),
      );
  }
}
