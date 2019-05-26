import 'package:chat_app/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//my own imports
import 'package:chat_app/componets/horizontal_listview.dart';
import 'package:chat_app/componets/products.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.orange,
        title: Text('Afrika Market'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
//            header
            new UserAccountsDrawerHeader(
              accountName: Text('Aminata Fall'),
              accountEmail: Text('aminatafall97@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.orange,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.orange
              ),
            ),

//            body

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Acceuil'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mon compte'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mes Commandes'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favories'),
                leading: Icon(Icons.favorite),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){
                FirebaseAuth.instance.signOut().then((value){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                });
              },
              child: ListTile(
                title: Text('Se deconnecter'),
                leading: Icon(Icons.transit_enterexit, color: Colors.grey,),
              ),
            ),

          ],
        ),
      ),

      body: new Column(
        children: <Widget>[
          //image carousel begins here
//          image_carousel,

          //padding widget
          new Padding(padding: const EdgeInsets.all(4.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Categories')),),

          //Horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Produits recents')),),

          //grid view
          Flexible(child: Products()),

        ],
      ),
    );
  }
}
