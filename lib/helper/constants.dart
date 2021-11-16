import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
const SUCCESS_MESSAGE = "You will be contacted by us very soon.";
const APP_TAG = "neumtech";

//Color Related

const Color primaryColor = const Color(0xFF000000);
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
Widget getAppBar(BuildContext context,String title,Widget body){
  return
    Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: true,
      title: Text(title), // title of AppBar
      centerTitle: true, // align the title to the center of the AppBar
      titleSpacing: 0.0, // letter spacing for title
      backgroundColor: primaryColor, // background color of the AppBar// Shadow color for the AppBar
      elevation: 10.0, // Elevation of the AppBar
      toolbarHeight: 60.0, // Height of the toolbar
      toolbarOpacity: 1.0, // Opacity of the toolbar
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.favorite_border,
                size: 26.0,
              ),
            )
        ),
        Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.add_shopping_cart,
                size: 26.0,
              ),
            )
        ),
        ] ,// Leading icon with function
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



