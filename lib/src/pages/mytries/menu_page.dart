import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _makeAppbar(),
       body: Stack(
         children: <Widget>[
           _imageContainer(context),
           _backgroundBottomContainer(context),
           _itemsContainer(context),
         ],
       ),
       bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  Widget _makeAppbar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: (){},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: (){},
        )
      ],
    );
  }

  Widget _imageContainer(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: screenSize.height * 0.45,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Image.asset(
            'assets/background_fit.jpg',
            fit: BoxFit.cover,
          ),

          _makeName(),

        ],
      ),
    );
  }

  Widget _makeName(){
    var titleStyle = TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold);
    var numberStyle = TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);
    var wordStyle = TextStyle(fontSize: 15.0, color: Colors.white);

    return Container(
      color: Colors.black26,
      padding: EdgeInsets.only(left: 30.0, bottom: 70.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[
          Text('CARLY', style: titleStyle),
          Text('JACKSON', style: titleStyle),
          SizedBox(height: 10.0),

          Row(            
            children: <Widget>[

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('1,208', style: numberStyle),
                  Text('followers', style: wordStyle),
                ],
              ),
              
              SizedBox(width: 50.0),
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('380', style: numberStyle),
                  Text('followin', style: wordStyle),
                ],
              ),


            ],
          ),

        ],
      ),
    );
  }

  Widget _backgroundBottomContainer(BuildContext context){
    var screenSize = MediaQuery.of(context).size;

    var bgContainer =  Container(
      height: screenSize.height * 0.5,
      width: double.infinity,
      color: Color.fromRGBO(240, 240, 240, 1.0),
      // color: Colors.blue,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        bgContainer
      ],
    );
  }

  Widget _itemsContainer(BuildContext context){

    var screenSize = MediaQuery.of(context).size;

    var container =  Container(
      height: screenSize.height * 0.55,
      // color: Colors.blue,
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),

      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _createMenus(['My Videos', 'Photos']),
            SizedBox(height: 20.0),
            _createMenus(['Statics', 'Trainings', 'Account', 'Settings']),
          ],
        ),
      )
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        container
      ],
    );
  }

  Widget _createMenus(List<String> menus){
    List<Widget> listMenu = List();

    menus.forEach((menu){
      listMenu.add(
        ListTile(
          title: Text(menu),
          leading: Icon(Icons.video_call),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){},
        )
      );
      listMenu.add(Divider(
        height: 5.0,
        thickness: 2.0,
      ));
    });

    listMenu.removeLast();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            spreadRadius: 2.0,
            color: Colors.black12,
            offset: Offset(2.0, 10.0),
          ),
        ]
      ),

      child: Column(
        children: listMenu,
      ),
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[

        _makeNavIcon(Icons.filter_drama, 'Feed'),
        _makeNavIcon(Icons.people, 'Friends'),
        _makeNavIcon(Icons.message, 'Message'),
        _makeNavIcon(Icons.settings, 'Settings'),
        _makeNavIcon(Icons.person, 'Profile'),

      ],
    );
  }

  BottomNavigationBarItem _makeNavIcon(IconData icon, String title){
    return BottomNavigationBarItem(
          icon: Icon(icon),
          title: Text(title)
      );
  }
}