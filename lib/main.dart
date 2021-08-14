import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/home_page.dart';
import 'package:flutter_catelog/pages/login_page.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  // bulid return a Widget
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      darkTheme: ThemeData(brightness: Brightness.dark),
      
      initialRoute: "/home",
      routes:{
        "/":(contex) => LoginPage(),
        "/home":(contex) => HomePage(),
        "/login":(contex) => LoginPage(),
      } ,
    );
  }
}
