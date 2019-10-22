import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ItemDetails extends StatefulWidget {
  final List userData;
  final int index;


  ItemDetails({Key key, @required this.userData,this.index}) : super(key: key);

  @override
  _ItemDetails createState() => _ItemDetails();
}


class _ItemDetails extends State<ItemDetails> {
//  final List userData;
//  final int index;
//
//  _ItemDetails({this.userData,this.index});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(

      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.userData[widget.index]["item_name"]),
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
                            NetworkImage(widget.userData[widget.index]["item_photo1"]),
                            NetworkImage(widget.userData[widget.index]["item_photo2"]),
                            NetworkImage(widget.userData[widget.index]["item_photo3"]),
                          ],
                        )
                    ),
                    Divider(
                      color: Colors.transparent,
                    ),
                    ListTile(
                      title: Text("₱${widget.userData[widget.index]["item_price"]}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange, fontSize: 23,),),
                      subtitle: Text("${widget.userData[widget.index]["item_name"]}",style: TextStyle(fontSize: 21,color: Colors.black87),),
                      leading: Icon(Icons.favorite_border, size: 30),
                    ),
                    ListTile(
                      title: Text("Item Description:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      subtitle: Text("Font weight has multiple values that can be supplied using the FontWeight consts. In addition to bold and normal you can supply actual weights by",style: TextStyle(color: Colors.black87, fontSize: 18),),
                    ),
                    ListTile(
                      title: Text("Item Specification:",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      subtitle: Text("Size: Small, Color: Blue" ,style: TextStyle(color: Colors.black87,fontSize: 17),),
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
                   RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text('Fixed Button'),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}