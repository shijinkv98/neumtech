import 'package:flutter/material.dart';
import 'package:medfeed/screens/home_page_screen.dart';
import 'package:provider/provider.dart';
import 'package:medfeed/blocs/home_bloc.dart';


void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers:[
        ChangeNotifierProvider(create: (_) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        home:HomePageScreen(),
      ),


    );


  }


}
