import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        middle: Text(userData[index]["item_name"]),
      ),
      child: Container(
        child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
            Card(
              elevation: 0,
              margin: EdgeInsets.all(10),
              child:Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[



                        Image.network(userData[index]["item_photo"],),
                    ListTile(

                      title: Text("P${userData[index]["item_price"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text("${userData[index]["item_name"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),


                  ],
              ),

            ),

//              Text(userData[index]["item_photo"]),
            ]
        ),
      ),
    );
  }
}




