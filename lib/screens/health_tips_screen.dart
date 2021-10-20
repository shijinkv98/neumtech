import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:medfeed/helper/constants.dart';
import 'package:medfeed/responses/health_response.dart';
import 'package:medfeed/widget/readmore_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:medfeed/blocs/home_bloc.dart';

final TextStyle style = TextStyle(
    color: white,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    letterSpacing: 0.8);
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
final TextStyle subTitile3 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
    color: Colors.grey,
   );

class HealthTipsScreen extends StatefulWidget {
  @override
  _HealthTipsScreenState createState() => new _HealthTipsScreenState();
}

class _HealthTipsScreenState extends State<HealthTipsScreen> {
  List<Tips> tips = new List<Tips>();
  bool isLiked;
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeBloc>(context, listen: false).getHealthData(context);
    // Provider.of<HomeBloc>(context, listen: false).getAdsContentsData(context);
    return  getSubAppBar(context, 'Health Tips', getBody(),);
  }
  Widget getBody(){
    return Consumer<HomeBloc>(
        builder: (context, homeBloc, child) => ModalProgressHUD(
        inAsyncCall: homeBloc.isLoading,
        child:Container(
          height: MediaQuery.of(context).size.height,
          color: primaryBg,
         child: getTopContainer(homeBloc),
    )));
  }
  String getText(String html)
  {

    String s1= html.replaceAll("<p>", "");
    String s2= s1.replaceAll('</p>', "");
    return s2;
  }

  Widget getTopContainer(HomeBloc homeBloc){
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 15,bottom: 20),
        width: MediaQuery.of(context).size.width,
      child:ListView.builder(
          itemCount: homeBloc.healthData[0].tips.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  // height:  MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-120,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(homeBloc.healthData[0].tips[index].title,style: subTitile,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                LikeButton(
                                  size: 20,
                                  circleColor:
                                  CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Color(0xff33b5e5),
                                    dotSecondaryColor: Color(0xff0099cc),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return ImageIcon(
                                      AssetImage('assets/love.png'),size: 20,color: homeBloc.healthData[0].tips[index].isLiked == 1 ? Colors.red : Colors.black,
                                    );
                                    //   Icon(
                                    //   Icons.home,
                                    //   color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                                    //   size: 20,
                                    // );
                                  },
                                  // likeCount: 665,
                                  countBuilder: (int count, bool isLiked, String text) {
                                    var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                                    Widget result;
                                    if (count == 0) {
                                      result = Text(
                                        "love",
                                        style: TextStyle(color: color),
                                      );
                                    } else
                                      result = Text(
                                        text,
                                        style: TextStyle(color: color),
                                      );
                                    return result;
                                  },
                                ),
                               SizedBox(width: 10),
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
                            fit: BoxFit.fill,
                            placeholder: homeBloc.healthData[0].tips[index].image,
                            image:homeBloc.healthData[0].tips[index].image
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(homeBloc.healthData[0].tips[index].title,style: subTitile2,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ReadMoreText(
                           getText(homeBloc.healthData[0].tips[index].description) ,
                            trimLines: 1,
                            textAlign: TextAlign.justify,
                            colorClickableText: Colors.pink,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Read less',
                            style: subTitile2,

                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width-40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(homeBloc.healthData[0].tips[index].postedOn,style: subTitile3,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: getBubble(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(homeBloc.healthData[0].tips[index].postedOn,style: subTitile3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: getBubble(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(homeBloc.healthData[0].tips[index].likeCount,style: subTitile3),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: getBubble(),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          })

    );
  }


}
