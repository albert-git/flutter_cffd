import 'package:flutter/material.dart' ;
import 'globals.dart' as globals;
import 'comms/localdb.dart' as db;
import 'login/index.dart' as login;





void main(){
  print(db.food.length);
  print(db.superMarket.length);
  globals.foodBreakfast = db.foodInitPage();
  globals.marketDrink = db.marketInitPage();
  runApp(MyApp());


}


class MyApp extends StatelessWidget {
//  final wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(

      routes: globals.allRoutes(context),
      title: 'Welcome to Flutter',
      home: login.Login()
    );
  }
}