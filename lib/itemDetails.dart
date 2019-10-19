import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';


class ItemDetails extends StatelessWidget {
  final List userData;
  final int index;
// In the constructor, require a Todo.
// ItemDetails({Key key, @required this.todo}) : super(key: key);
  ItemDetails({this.userData,this.index});
  @override
  Widget build(BuildContext context) {
//    print(userData[index].toString());
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
//        middle: Text("Item Details"),
        middle: Text(userData[index]["item_name"]),
      ),
      child: Container(
        child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Card(
                elevation: 0,
                margin: EdgeInsets.all(5),
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                    Image.network(userData[index]["item_photo"],height: 300.0, width: 550.0),
                    SizedBox(
                        height: 330.0,
//                        width: 900.0,
                        child: Carousel(
                          boxFit: BoxFit.contain,
                          autoplay: false,
                          animationCurve: Curves.easeInOut,
                          animationDuration: Duration(milliseconds: 1000),
                          dotSize: 10.0,
                          dotIncreasedColor: Colors.black,
                          dotBgColor: Colors.transparent,
                          dotColor: Colors.grey,
                          dotPosition: DotPosition.bottomLeft,
                          dotVerticalPadding: 10.0,
                          showIndicator: true,
                          indicatorBgPadding: 0.0,
                          images:[
                            NetworkImage(userData[index]["item_photo1"]),
                            NetworkImage(userData[index]["item_photo2"]),
                            NetworkImage(userData[index]["item_photo3"]),
                          ],
                        )
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    ListTile(
                      title: Text("P${userData[index]["item_price"]}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),),
                      subtitle: Text("${userData[index]["item_name"]}",style: TextStyle( fontSize: 18),),
                      leading: Icon(Icons.favorite_border, size: 30),
                    ),
                    ListTile(
                      title: Text("Item Description:",style: TextStyle( fontSize: 16,),),
                      subtitle: Text("Font weight has multiple values that can be supplied using the FontWeight consts. In addition to bold and normal you can supply actual weights by",style: TextStyle( fontSize: 18),),
                    ),
                    ListTile(
                      subtitle: Text("Size: Small, Color: Blue" ,style: TextStyle( fontSize: 17),),
                    ),
                  ],
                ),

              ),
              Card(
                elevation: 0,
                margin: EdgeInsets.all(1),
                child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                  ],
                ),
              ),

//              Text(userData[index]["item_photo"]),
            ]
        ),
//        child: ListView(
//            physics: BouncingScrollPhysics(),
//            children: <Widget>[
//              Image.network(userData[index]["item_photo"],),
////              Text(userData[index]["item_photo"]),
//            ]
//        ),
      ),
    );
  }
}