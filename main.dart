
import 'package:my_app2/Cart_Page.dart';
import 'package:my_app2/SpashScreen.dart';
import 'package:my_app2/detailsPage.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color.fromARGB(255, 0, 179, 45 ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0,left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.black,
                  onPressed: () {
                  },
                ),
                Container(
                  width: 125.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.filter_list),
                        color: Colors.black,
                        onPressed: () {},
                      ),
    IconButton(
    icon: Icon(Icons.menu),
    color: Colors.black,
    onPressed: () {},
    ),],
                  ),
                )
              ],
            ),
          ),
        SizedBox(height: 25.0),
          Padding(
          padding : EdgeInsets.only(left: 40.0),
          child: Row(
            children: <Widget>[
              Text(
                'Shopping ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 25.0)),
              SizedBox(width: 10.0),
              Text(
                'Cart',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  fontSize: 25.0))
                ],
          ),
              ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height-185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0,right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height-300.0,
                    child: ListView(
                      children: <Widget>[
                        _buildCartItems('assets/apple-png.png', 'Apple', '@ 120/-',context),
                        _buildCartItems('assets/grape_PNG2977.png', 'Grapes', '@ 150/-',context),
                        _buildCartItems('assets/stra_png.png', 'Strawberry', '@ 180/-',context),
                        _buildCartItems('assets/Orange-PNG.png', 'Orange', '@ 190/-',context),
                        _buildCartItems('assets/Pineapple-PNG.png', 'Pineapple', '@ 100/-',context)
                      ],
                    ),
                  ),
                ),
                  ],
                )
    ),],
            ),
        );
  }
}

Widget _buildCartItems( String imgPath, String itemsName, String itemPrize, BuildContext context){
  return Padding(
    padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
    child: InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>DetailsPage(heroTag: imgPath,itemsNames: itemsName,itemsPrize: itemPrize,)
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Hero(
                  tag: imgPath,
                  child: Image(
                    image: AssetImage(imgPath),
                  fit: BoxFit.cover,
                    height: 75.0,
                    width: 75.0,
                  ),
                ),
                SizedBox(width:10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      itemsName,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      itemPrize,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.black87,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage(heroTag:imgPath,itemsNames: itemsName,itemsPrize: itemPrize,)));
            },
          )
        ],
      ),
    ),
  );
}
