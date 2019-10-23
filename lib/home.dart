import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_pro/carousel_pro.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'itemDetails.dart';
import 'dart:async';
import 'dart:convert';

class HomeT extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<HomeT> {

  Map data;
  List userData;


  Future getItems() async {
    http.Response response = await http.get("http://172.16.46.130/olstore_serv/get_items");
    data = json.decode(response.body);
    setState(() {
      userData  = data["item"];
    });
  }


  @override
  void initState(){
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context){
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Products',style: TextStyle(
              fontSize: 13.0, // insert your font size here
            ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            title: Text('Transactions',style: TextStyle(
              fontSize: 13.0, // insert your font size here
            ),),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: home(context),
              );
            });
            break;
          case 1:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: grade(context),
              );
            });
            break;
          case 2:
            returnValue = CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: profile(context),
              );
            });
            break;
        }
        return returnValue;
      },
    );
  }

  Widget home(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
//          leading: Icon(CupertinoIcons.back,color: Colors.black),
          middle: Text("Home"),
          trailing: Icon(CupertinoIcons.shopping_cart),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: RefreshIndicator(

                onRefresh: getItems,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
//                  CarouselSlider(
//                    items: child,
//                    autoPlay: true,
//                    enlargeCenterPage: true,
//                    aspectRatio: 2.0,
//                  ),
                    SizedBox(
                        height: 330.0,
                        width: 300.0,
                        child: Carousel(
                          boxFit: BoxFit.contain,
                          autoplay: true,
                          animationCurve: Curves.easeInOut,
                          animationDuration: Duration(milliseconds: 1300),
                          dotSize: 10.0,
                          dotIncreasedColor: Colors.black,
                          dotColor: Colors.grey,
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.bottomLeft,
                          dotVerticalPadding: 10.0,
                          showIndicator: true,
                          indicatorBgPadding: 10.0,
                          images: [
                            NetworkImage('http://172.16.46.130/olstore_serv/assets/images/71QTkaXtxjL._SL1500_.jpg',),
                            NetworkImage('http://172.16.46.130/olstore_serv/assets/images/20297695.png'),
                            NetworkImage('http://172.16.46.130/olstore_serv/assets/images/a172190b7657d71c372b39d9ad26c74c933cba35.jpg'),
                            NetworkImage('http://172.16.46.130/olstore_serv/assets/images/download (1).jpg'),
                            NetworkImage('http://172.16.46.130/olstore_serv/assets/images/download.jpg')
                          ],
                        )
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),

                    Center(
                        child: Text(
                          'Categories',
                          style: TextStyle(color: Colors.black87,decoration: TextDecoration.none,fontSize: 17), // removes yellow line
                        )
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200.0,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[

                          GestureDetector(
                            onTap: () {
                              print("Container was tapped");
                            },
                           child: new Card(
                             color: Colors.transparent,
                              elevation: 0.0,
                              child: new Container(
                                padding: new EdgeInsets.all(40.0),
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(FontAwesomeIcons.wineBottle,size: 40,),
                                    Divider(
                                      height: 30.0,
                                      color: Colors.transparent,
                                    ),
                                    new Text('Wine',style: TextStyle(color: Colors.black87, fontSize: 17),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              print("Container was tapped");
                            },
                            child: new Card(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: new Container(
                                padding: new EdgeInsets.all(40.0),
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(FontAwesomeIcons.mugHot,size: 40,),
                                    Divider(
                                      height: 30.0,
                                      color: Colors.transparent,
                                    ),
                                    new Text('Mugs',style: TextStyle(color: Colors.black87, fontSize: 17),),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          GestureDetector(
                            onTap: () {
                              print("Container was tapped");
                              },
                            child: new Card(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: new Container(
                                padding: new EdgeInsets.all(40.0),
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(FontAwesomeIcons.bone,size: 40,),
                                    Divider(
                                      height: 30.0,
                                      color: Colors.transparent,
                                    ),
                                    new Text('Bone',style: TextStyle(color: Colors.black87, fontSize: 17),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              print("Container was tapped");
                              },
                            child: new Card(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: new Container(
                                padding: new EdgeInsets.all(40.0),
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(FontAwesomeIcons.appleAlt,size: 40,),
                                    Divider(
                                      height: 30.0,
                                      color: Colors.transparent,
                                    ),
                                    new Text('Fresh Fruits',style: TextStyle(color: Colors.black87, fontSize: 17),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              print("Container was tapped");
                              },
                            child: new Card(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: new Container(
                                padding: new EdgeInsets.all(40.0),
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(FontAwesomeIcons.breadSlice,size: 40,),
                                    Divider(
                                      height: 30.0,
                                      color: Colors.transparent,
                                    ),
                                    new Text('Breads',style: TextStyle(color: Colors.black87, fontSize: 17),),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              print("Container was tapped");
                              },
                            child: new Card(
                              color: Colors.transparent,
                              elevation: 0.0,
                              child: new Container(
                                padding: new EdgeInsets.all(40.0),
                                child: new Column(
                                  children: <Widget>[
                                    new Icon(FontAwesomeIcons.pizzaSlice,size: 40,),
                                    Divider(
                                      height: 30.0,
                                      color: Colors.transparent,
                                    ),
                                    new Text('Pizza',style: TextStyle(color: Colors.black87, fontSize: 17),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    new GridView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: userData == null ? 0: userData.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                new CupertinoPageRoute(
                                  builder: (context) {
                                    return new ItemDetails(userData:userData,index:index);
                                  },
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.favorite_border, size: 30),
                                    title: Text("₱${userData[index]["item_price"]}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange, fontSize: 21,),),
                                    subtitle: Text("${userData[index]["item_name"]}",style: TextStyle(fontSize: 17,color: Colors.black87),),
                                  ),
                                  new Expanded(
                                    child: new Container(
                                      margin: EdgeInsets.only(bottom: 40),
                                      child: Image.network(userData[index]["item_photo1"],),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 0,
                              margin: EdgeInsets.all(5),
                            ),
                          );
//                       ),
//                      );
                      }),

                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget grade(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
//          leading: Icon(CupertinoIcons.back,color: Colors.black),
        middle: Text("Transactions"),
//          trailing: Icon(CupertinoIcons.settings),
      ),
      child: ListView(
        children: <Widget>[
          Text('Transactions'),
        ],
      ),
    );
  }

  Widget profile(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
//          leading: Icon(CupertinoIcons.back,color: Colors.black),
        middle: Text("profile"),
//          trailing: Icon(CupertinoIcons.settings),
      ),
      child: ListView(
        children: <Widget>[
          Text('profile'),
        ],
      ),
    );
  }
}


