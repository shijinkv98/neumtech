import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neumtech/helper/constants.dart';
import 'package:neumtech/screens/details_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:neumtech/blocs/home_bloc.dart';

final TextStyle style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    letterSpacing: 0.8);
final TextStyle subTitile = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.grey,
   );

class HomePageScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<HomePageScreen> {

  @override
  void initState() {
    Provider.of<HomeBloc>(context, listen: false).getHomeData(context);
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return getAppBar(context, 'Neumtech',getBody());
  }
  Widget getBody(){
    return Consumer<HomeBloc>(
        builder: (context, homeBloc, child) => ModalProgressHUD(
        inAsyncCall: homeBloc.isLoading,
        child:Container(
          color: primaryBg,
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               getBannerSlider(homeBloc),
               Padding(
                 padding: const EdgeInsets.only(left: 15,top: 15,),
                 child: Text('Top Items',style: subTitile,),
               ),
               getMiddleContainer(homeBloc),
               Padding(
                 padding: const EdgeInsets.only(left: 15,top: 15,),
                 child: Text('Featured Items',style: subTitile,),
               ),
               getTopContainer(homeBloc),
               SizedBox(height: 20),
               // _tabSection(context,homeBloc)
             ],
           ),
         ),
    )));
  }
  Widget getTopContainer(HomeBloc homeBloc){
    return Container(
      height: 150,
        margin: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
      child:ListView.builder(
        reverse: true,
          itemCount:homeBloc.listData.length,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.only(left: 2,),
              child: InkWell(
                onTap: (){
                  nextPagePush(context, FeaturedScreen(id: homeBloc.listData[index].animeId,name: homeBloc.listData[index].animeName,image: homeBloc.listData[index].animeImg,title: 'Featured Items',));
                },
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 150,
                    width: 150,
                    child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.fitWidth,
                          height: 120,
                          width: 120,
                          placeholder: 'assets/load.png',
                          image:homeBloc.listData[index].animeImg,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          })

    );
  }

  Widget getMiddleContainer(HomeBloc homeBloc) {
    double width = MediaQuery.of(context).size.width - 15;
    double height = 240;
    double aspect = (width / 2) / height;
    return Container(

      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      child:
      GridView.builder(
          // itemCount: 9,
          itemCount: homeBloc.listData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 110,
              childAspectRatio: 0.8,
              mainAxisSpacing: 2,
              crossAxisSpacing: 9),
          semanticChildCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return   InkWell(
              onTap: (){
               nextPagePush(context, FeaturedScreen(id: homeBloc.listData[index].animeId,name: homeBloc.listData[index].animeName,image: homeBloc.listData[index].animeImg,title: 'Top Items',));

              },
              child: Container(
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                        FadeInImage.assetNetwork(
                          fit: BoxFit.fill,
                          height: 80,
                          width: 100,
                          placeholder: 'assets/load.png',
                          image:homeBloc.listData[index].animeImg,
                        ),
                      ),
                    ),
                    // Text('MedArticle',style: subTitile,)
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget getBannerSlider(HomeBloc homeBloc) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: homeBloc.listData.length > 1 ? true : false,
            autoPlayCurve: Curves.ease,
            enableInfiniteScroll: homeBloc.listData.length > 1 ? true : false,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 1.0,
          ),
          items: homeBloc.listData.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return  InkWell(
                    onTap: (){},
                    child: getImageBanner(i.animeImg));
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget getImageBanner(String url) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: FadeInImage.assetNetwork(
          imageErrorBuilder: (BuildContext context, Object exception, StackTrace stackTrace)=>Image(
            image: AssetImage("assets/load.png"),
            fit: BoxFit.fitWidth,
          ),
          placeholder: 'assets/load.png',
          image: url,
          fit: BoxFit.fill,
        ),
      ),
    );
  }


}


