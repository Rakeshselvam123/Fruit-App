import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app2/Cart_Page.dart';
class DetailsPage extends StatefulWidget {
  final heroTag;
  final itemsNames;
  final itemsPrize;
  DetailsPage({this.heroTag,this.itemsNames,this.itemsPrize});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard='info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,102,102,102),
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Detail Page',
          style: TextStyle(
            fontFamily: 'Montserrat',fontSize: 18.0,color:Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CartPage(heroTag: widget.heroTag,itemsNames: widget.itemsNames,itemsPrize: widget.itemsPrize,)));
            },
            color:Colors.white,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height -82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 75.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0)),
                    color: Colors.white
                  ),
                ),
                height: MediaQuery.of(context).size.height-100.0,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width/2)-100.0,
                child: Hero(
                    tag: widget.heroTag,
                  child: Container(
                    decoration: BoxDecoration(
                      image:DecorationImage(
                        image: AssetImage(widget.heroTag),
                        fit: BoxFit.cover
                      ),
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
              ),
              Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.itemsNames,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                    )),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(widget.itemsPrize,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          color: Colors.black
                        ),),
                        Container(
                          width: 120.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: Color.fromARGB(255,102,102,102)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  height: 35.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                  color: Color.fromARGB(255, 102, 102, 102)),
                                  child:RaisedButton(
                                    color: Color.fromARGB(255,102 ,102,102),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder:  (context)=>CartPage(heroTag: widget.heroTag,itemsNames:widget.itemsNames,itemsPrize:widget.itemsPrize )
                                              ));
                                            },
                                            child: Center(
                                    child: Text('ADD TO CART',style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.0
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                              ),],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0),
                      Container(
                        height: 150.0,
                      child:
                      ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                           _infoCard('Weight','200', 'G',),
                          SizedBox(width: 10.0),
                          _infoCard('Calories', '267', 'CAl'),
                          SizedBox(width: 10.0),
                          _infoCard('VITAmins', 'A', 'VIT'),
                          SizedBox(width: 10.0),
                          _infoCard('Avail', 'Yes', 'AV')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                     child: FlatButton(
                       child: Container(
                         alignment: Alignment.center,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0)),
                             color: Color.fromARGB(255, 102, 102, 102)
                         ),
                         height: 40.0,
                         child: Center(
                           child: Text(
                             widget.itemsPrize,
                             style: TextStyle(
                                 color: Colors.black,
                                 fontFamily: 'Montserrat'
                             ),
                           ),
                         ),
                       ),
                       onPressed: (){
                       },
                     ),
                    )
                  ],
    ),),],)
              ],),
          );
  }
  Widget _infoCard( String cardTittle,String info,String unit){
    return SingleChildScrollView(
      child:
      InkWell(
      onTap: (){
        SelectCard(cardTittle);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cardTittle == selectedCard ? Color.fromARGB(255,102,102,102) :Colors.transparent,
            border: Border.all(
            color: cardTittle ==selectedCard ?
                Colors.transparent :
                Colors.grey,
            style: BorderStyle.solid,
            width: 1.5,
          )
        ),
        height: 100,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0,left: 15.0),
              child: Text(cardTittle,style:
                TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12.0,
                  color: cardTittle == selectedCard ? Colors.white: Colors.black.withOpacity(0.3),
                  fontWeight: FontWeight.bold
                ), ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(info,
                    style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                    color: cardTittle == selectedCard ? Colors.white:Colors.black,
                      fontWeight: FontWeight.bold)),
                  ], ),
                  ),
                  Text(
                    unit,style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12.0,
                    color: cardTittle == selectedCard ?  Colors.black: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  )
                ],
              ),
            )
        ),
      );
  }
  // ignore: non_constant_identifier_names
  SelectCard(cardTittle){
    setState(() {
      selectedCard= cardTittle;
    });
  }
}


