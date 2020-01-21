import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RecipiesPage extends StatelessWidget {

  final recipies = [
    Recipie('Grilled Sea Bass', '8 min | 3 servings', 'https://media.fromthegrapevine.com/assets/images/2015/1/grilled_sea_bass.jpg.839x0_q71_crop-scale.jpg'),
    Recipie('Thai Avocado Salad', '5 min | 3 servings', 'https://i.pinimg.com/originals/ee/6c/83/ee6c83704dba65e2e9cb166f1ad4b688.jpg'),
    Recipie('Avocado Fried Noodels', '10 min | 4 servings', 'https://i.ytimg.com/vi/u04Ur6zPvPg/maxresdefault.jpg'),
    Recipie('Creamed Sea Bass', '8 min | 3 servings', 'http://ahintofwine.com/wp-content/uploads/2014/06/DSC_2142.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _makeAppBar(),
      body: Stack(
        children: <Widget>[
          _containerImage(context),
          _containerList(context),
          _createFloattingButton(context),
        ],
      ),
      
    );
  }

  Widget _makeAppBar() {
    return AppBar(
      title: Text('Ingredients'),
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
      ],
    );    
  }

  Widget _containerImage(BuildContext context){
    var _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.65,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[

         _createImage(),
         _createTitle(),

        ],
      ),
    );
  }

  Widget _createImage(){
    return Image(
            image: NetworkImage('https://res.cloudinary.com/paleoleap/image/upload/f_auto,q_80/v1429434559/cranberry-avocado-salad-main_bsa3ay.jpg'),
            fit: BoxFit.cover,
          );
  }

  Widget _createTitle(){
    var titleStyle = TextStyle(fontSize: 40.0, color: Colors.white, fontWeight: FontWeight.bold);
    var subtitleStyle = TextStyle(fontSize: 20.0, color: Colors.white);
    var infoStyle = TextStyle(fontSize: 15.0, color: Colors.white);

    return Container(
      color: Colors.black38,
      padding: EdgeInsets.only(bottom: 30.0, left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Avocado Salad', style: titleStyle),
          Divider(
            color: Colors.white,
            endIndent: 50.0,
            thickness: 3.0,
          ),
          Text('80 calories per 100 gr.', style: subtitleStyle),
          Text('30g | 10 gr protein | 80 calories', style: infoStyle),
          SizedBox(height: 20.0),
          RaisedButton(
            child: Text('LEARN MORE', style: infoStyle),
            shape: StadiumBorder(),
            textColor: Colors.white,
            color: Colors.white24,
            onPressed: (){},
          ),
        ],
      ),
    );
  }

  Widget _containerList(BuildContext context){
    var _screenSize = MediaQuery.of(context).size;

    var container =  ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Container(
        height: _screenSize.height * 0.38,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _containerListTitle(),
            _createListView(),
          ],
        ),
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        container
      ],
    );
  }

  Widget _containerListTitle(){
    var titleStyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
    var subtitleStyle = TextStyle(fontSize: 15.0);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Recipies', style: titleStyle),
          SizedBox(height: 5.0),
          Text('18 recipies available', style: subtitleStyle),
        ],
      ),
    );
  }

  Widget _createListView(){
    return Expanded(
      child: ListView(        
        children: recipies.map((recipie){

        return ListTile(
          leading: Image(
            image: NetworkImage(recipie.image),
            height: 50.0,
            width: 50.0,
            fit: BoxFit.cover,
          ),
          title: Text(recipie.name),
          subtitle: Text(recipie.description),
          trailing: IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: (){},
          ),
        );
            
        }).toList(),

      ),
    );
  }

}

Widget _createFloattingButton(BuildContext context){
    var _screenSize = MediaQuery.of(context).size;

  return Positioned(
    top: _screenSize.height * 0.59,
    right: 20.0,
    child: FloatingActionButton(
      child: Icon(Icons.share),
      mini: true,
      backgroundColor: Colors.black,
      onPressed: (){},
    ),
  );
}

class Recipie{
  String name;
  String description;
  String image;

  Recipie(this.name, this.description, this.image);
}
