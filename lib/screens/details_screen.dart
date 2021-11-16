import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neumtech/helper/constants.dart';

import 'home_page_screen.dart';
final TextStyle subTitile = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black,
   );
final TextStyle subTitile2 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.black54,
   );
class FeaturedScreen extends StatefulWidget {
  String id;
  String name;
  String image;
  String title;
  @override
  _FeaturedScreenState createState() => new _FeaturedScreenState(id:this.id,name:this.name,image:this.image,title:this.title);
  FeaturedScreen({this.id,this.name,this.image,this.title});

}

class _FeaturedScreenState extends State<FeaturedScreen> {
  String id;
  String name;
  String image;
  bool isLiked;
  String title;
  _FeaturedScreenState({this.image,this.name,this.id,this.title});
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return  getAppBar(context, title,getBody());
  }
  Widget getBody(){
    return getTopContainer();
  }


  Widget getTopContainer(){
    return Container(
        margin: EdgeInsets.only(top: 15,bottom: 20),
        width: MediaQuery.of(context).size.width,
      child:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_border,size: 20,color: Colors.black,),
                            SizedBox(width: 5),
                            Icon(Icons.share,size: 20,color: Colors.black,)
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      child: FadeInImage.assetNetwork(
                        width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                          placeholder:'assets/love.png',
                          image:image
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width-40,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 18,left: 15),
                              child: getBubble(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('${'Item Id :'}$id',style: style,),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: getBubble(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('${'Description : '}$name',style: style),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )

    );
  }


}
