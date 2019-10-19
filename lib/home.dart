import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_pro/carousel_pro.dart';
import 'itemDetails.dart';
import 'dart:async';
import 'dart:convert';


//final List<String> imgList = [
//  'http://172.16.46.130/olstore_serv/assets/images/71QTkaXtxjL._SL1500_.jpg',
//  'http://172.16.46.130/olstore_serv/assets/images/9532a332c6db4f7dbc540142_original_.jpg',
//  'http://172.16.46.130/olstore_serv/assets/images/20297695.png',
//  'http://172.16.46.130/olstore_serv/assets/images/a172190b7657d71c372b39d9ad26c74c933cba35.jpg',
//  'http://172.16.46.130/olstore_serv/assets/images/download (1).jpg',
//  'http://172.16.46.130/olstore_serv/assets/images/download.jpg'
//];



//final Widget placeholder = Container(color: Colors.grey);
//
//final List child = map<Widget>(
//  imgList,
//      (index, i) {
//    return Container(
//      margin: EdgeInsets.all(5.0),
//      child: ClipRRect(
//        borderRadius: BorderRadius.all(Radius.circular(5.0)),
//        child: Stack(children: <Widget>[
//          Image.network(i, fit: BoxFit.cover, width: 1000.0),
//          Positioned(
//            bottom: 0.0,
//            left: 0.0,
//            right: 0.0,
//            child: Container(
//              decoration: BoxDecoration(
//                gradient: LinearGradient(
//                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
//                  begin: Alignment.bottomCenter,
//                  end: Alignment.topCenter,
//                ),
//              ),
//              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//              child: Text(
//                'No. $index image',
//                style: TextStyle(
//                  color: Colors.white,
//                  fontSize: 20.0,
//                  fontWeight: FontWeight.bold,
//                ),
//              ),
//            ),
//          ),
//        ]),
//      ),
//    );
//  },
//).toList();

//List<T> map<T>(List list, Function handler) {
//  List<T> result = [];
//  for (var i = 0; i < list.length; i++) {
//    result.add(handler(i, list[i]));
//  }
//
//  return result;
//}

class HomeT extends StatefulWidget {
//  MainFeedPage({Key key, @required this.empId}) : super(key: key);
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
//    debugPrint(userData.toString());
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
//          BottomNavigationBarItem(
//            icon: Icon(CupertinoIcons.person),
//            title: Text('Profile',style: TextStyle(
//              fontSize: 13.0, // insert your font size here
//            ),),
//          ),
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
          trailing: Icon(CupertinoIcons.profile_circled),
        ),
        child: Column(

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
                          animationDuration: Duration(milliseconds: 1000),
                          dotSize: 7.0,
                          dotIncreasedColor: Color(0xFFFF335C),
                          dotBgColor: Colors.transparent,
                          dotPosition: DotPosition.bottomCenter,
                          dotVerticalPadding: 10.0,
                          showIndicator: true,
                          indicatorBgPadding: 7.0,
                          images: [
                            NetworkImage('http://172.16.46.130/olstore_serv/assets/images/71QTkaXtxjL._SL1500_.jpg'),
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
                      child: CupertinoButton(
                        child: Text('View Categories',style: TextStyle(color: Colors.black ,fontSize: 20.0, ),),
                        onPressed:(){
                          Navigator.of(context, rootNavigator: true).push(
                            new CupertinoPageRoute(
                              builder: (context){
                                return new ItemDetails();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
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
                                    title: Text("P${userData[index]["item_price"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                    subtitle: Text("${userData[index]["item_name"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ),
                                  new Expanded(
                                    child: new Container(
                                      margin: EdgeInsets.only(bottom: 40),
                                      child: Image.network(userData[index]["item_photo"],),
                                    ),
                                  ),
                                ],
                              ),
                              elevation: 0,
                              margin: EdgeInsets.all(10),
                            ),
//
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


