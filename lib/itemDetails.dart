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




