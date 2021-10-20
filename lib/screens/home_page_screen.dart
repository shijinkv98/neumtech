import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medfeed/helper/constants.dart';
import 'package:medfeed/screens/health_tips_screen.dart';
import 'package:medfeed/widget/custome_tabview.dart';
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
    color: Colors.grey,
   );

class HomePageScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => new _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<HomePageScreen> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Provider.of<HomeBloc>(context, listen: false).getHomeData(context);
    return  Consumer<HomeBloc>(
        builder: (context, homeBloc, child) => ModalProgressHUD(
        inAsyncCall: homeBloc.isLoading,
        child:getAppBar(context, 'MedFeed',homeBloc.dataHome.bookmarkCount.toString(),getBody())));
  }
  Widget getBody(){
    return Consumer<HomeBloc>(
        builder: (context, homeBloc, child) => ModalProgressHUD(
        inAsyncCall: homeBloc.isLoading,
        child:Container(
          color: primaryBg,
         child: SingleChildScrollView(
           child: Column(
             children: [
               getTopContainer(homeBloc),
               getMiddleContainer(homeBloc),
               SizedBox(height: 20),
               _tabSection(context,homeBloc)
             ],
           ),
         ),
    )));
  }
  int tbPosition = 0;
  Widget _tabSection(BuildContext context,HomeBloc homeBloc) {
    return DefaultTabController(
      length: 2,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child:
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child:
                TabBar(
                  isScrollable: true,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0, color: primaryColor),
                    insets: EdgeInsets.only(top: 10),
                  ),
                  indicatorSize: TabBarIndicatorSize.label ,
                  indicatorColor:primaryColor,
                  labelColor: Colors.black,
                  automaticIndicatorColorAdjustment: true,
                  unselectedLabelColor: Colors.grey,
                  indicatorPadding:EdgeInsets.only(left: 5,right: 5) ,

                  tabs: [
                    Container(
                      height: 30,width: 100,
                      child: Center(child: Text(homeBloc.article[0].name))),
                    Container(
                      height: 30,width: 100,
                      child: Center(child: Text(homeBloc.article[1].name))),
                   ],
                ),
              ),
            ),

          ),
          Container(
            height: 250,
            child: TabBarView(
                children: [
              Container(
                height:150,
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fill,
                    placeholder: homeBloc.article[0].articleList[0].image,
                    image:homeBloc.article[0].articleList[0].image,
                  ),
                ),
              ),
                  Container(
                    height:150,
                    margin: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        placeholder: homeBloc.article[0].articleList[1].image,
                        image:homeBloc.article[0].articleList[0].image,
                      ),
                    ),
                  ),


            ]),
          ),
        ],
      ),
    );
  }

  Widget getTab(HomeBloc homeBloc){
    CustomTabView(
      initPosition: tbPosition,
      itemCount: homeBloc.banner.length,
      tabBuilder: (context, index) => Tab(text: homeBloc.banner[index].sId),
      pageBuilder: (context, index) =>
          _listview(homeBloc),
      onPositionChange: (index) {
        print('current position: $index');
        // initPosition = index;
      },
      onScroll: (position) => print('$position'),
    );  }

  Widget _listview(HomeBloc homeBloc) => ListView.builder(
      itemBuilder: (context, index) =>
          FadeInImage.assetNetwork(
            fit: BoxFit.fill,
            placeholder: homeBloc.banner[index].image,
            image:homeBloc.banner[index].image,
          ),
      itemCount: homeBloc.article.length);

  Widget getTopContainer(HomeBloc homeBloc){
    return Container(
        height: 200,
        margin: EdgeInsets.only(top: 15),
        width: MediaQuery.of(context).size.width,
      child:ListView.builder(
          itemCount: homeBloc.banner.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: FadeInImage.assetNetwork(
                fit: BoxFit.fill,
                placeholder: homeBloc.banner[index].image,
                image:homeBloc.banner[index].image,
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

      margin: EdgeInsets.only(left: 33, right: 33, top: 33),
      child:
      GridView.builder(
          itemCount: homeBloc.category.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 125,
              childAspectRatio: 0.8,
              mainAxisSpacing: 9,
              crossAxisSpacing: 9),
          semanticChildCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext ctx, index) {
            return   InkWell(
              onTap: (){
                nextPagePush(context, HealthTipsScreen());
              },
              child: Container(
                height: 80,
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child:
                        FadeInImage.assetNetwork(
                          fit: BoxFit.fill,
                          placeholder: homeBloc.category[index].image,
                          image:homeBloc.category[index].image,
                        ),
                      ),
                    ),
                    Text('MedArticle',style: subTitile,)
                  ],
                ),
              ),
            );
          }),
    );
  }


}
