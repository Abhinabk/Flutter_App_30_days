import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/home_page.dart';
import 'package:flutter_catelog/pages/login_page.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:flutter_catelog/widgets/themes.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  // bulid return a Widget
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme:MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: "/login",
      routes:{
        "/":(contex) => LoginPage(),
        MyRoutes.homeRoute:(contex) => HomePage(),
        MyRoutes.loginRoute:(contex) => LoginPage(),
      } ,
    );
  }
}
