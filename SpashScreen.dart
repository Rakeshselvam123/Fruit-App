import 'package:flutter/material.dart';
import 'package:my_app2/main.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color.fromARGB(255,230,230,0),
              gradient: LinearGradient(
                colors: [
                  new Color.fromARGB(255, 255, 77, 77),new Color.fromARGB(255, 102, 255, 255)],
                begin:  Alignment.centerRight,
                end: Alignment.centerLeft
              ),
    ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 80.0,
              child: IconButton(icon: Icon(Icons.shopping_cart),
                color: Colors.white,
                iconSize: 85.0,
                onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> FirstScreen(),
                ),);
                },
              ),
            ),
          Padding(
    padding: EdgeInsets.only(top: 15),
          ),
            Text('FRUIT CART',style: TextStyle(
    fontWeight: FontWeight.bold,
              color: Colors.black
    ),
            ),],
        ),
        ],),
              );
  }
}
