import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const SUCCESS_MESSAGE = "You will be contacted by us very soon.";
const APP_TAG = "MedFeed";

//Color Related

const Color primaryColor = const Color(0xFF11c313);
const Color primaryBg = const Color(0xFFf4f4f4);
const Color white = const Color(0xFFFFFFFF);
const Color bubbleColor = const Color(0xFFC4C4C4);

//Box Decorations Related
BoxDecoration bubble= BoxDecoration(
  shape: BoxShape.circle,
  color:bubbleColor
);
//Widgets Related
Widget getBubble(){
  return Container(
    height: 4,width: 4,
    decoration: bubble,
  );
}
Widget getAppBar(BuildContext context,String title,String text,Widget body){
  return Scaffold(

    appBar: AppBar(
      title: Text(title), // title of AppBar
      centerTitle: true, // align the title to the center of the AppBar
      titleSpacing: 0.0, // letter spacing for title
      backgroundColor: primaryColor, // background color of the AppBar// Shadow color for the AppBar
      elevation: 10.0, // Elevation of the AppBar
      toolbarHeight: 60.0, // Height of the toolbar
      toolbarOpacity: 1.0, // Opacity of the toolbar
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_backspace)),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
        ),
            Badge(
            position: BadgePosition.topEnd(top: 3, end: 18),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                padding: EdgeInsets.only(right: 30.0),
                onPressed: () {}),
          ),
        ] ,// Leading icon with function
      leadingWidth: 50.0, // Width of leading icon
    ),
    body: body,
    backgroundColor: white,
  );
}
Widget getSubAppBar(BuildContext context,String title,Widget body){
  return Scaffold(
    bottomNavigationBar:
    Container(
        height: 60,
         decoration: BoxDecoration(
          color: white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),topRight: Radius.circular(25.0),)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

children: [
  Container(
      width: MediaQuery.of(context).size.width/3-2,
      child: Center(child: Text('newest'))),
  VerticalDivider(width: 2,),
  Container(
      width: MediaQuery.of(context).size.width/3-2,
      child: Center(child: Text('newest'))),
  VerticalDivider(width: 2,),
  Container(
      width: MediaQuery.of(context).size.width/3-2,
      child: Center(child: Text('newest'))),

],      ),

    ),appBar: AppBar(
      title: Text(title),
      automaticallyImplyLeading: true,// title of AppBar
      centerTitle: true, // align the title to the center of the AppBar
      titleSpacing: 0.0, // letter spacing for title
      backgroundColor: primaryColor, // background color of the AppBar// Shadow color for the AppBar
      elevation: 10.0,
      toolbarHeight: 60.0,
      toolbarOpacity: 1.0,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
        ),
      ],
      leadingWidth: 50.0, // Width of leading icon
    ),
    body: body,
    backgroundColor: white,
  );
}

//Next Page  Related
void nextPagePush(BuildContext context,Widget nextPage){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
  );
}
void nextPagePushReplacement(BuildContext context,Widget nextPage){
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => nextPage),
  );
}



