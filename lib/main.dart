import 'package:flutter/material.dart';
import 'package:flutter_catelog/pages/home_page.dart';
import 'package:flutter_catelog/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  // bulid return a Widget
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      
      initialRoute: "/login",
      routes:{
        "/":(contex) => LoginPage(),
        "/home":(contex) => HomePage(),
        "/login":(contex) => LoginPage(),
      } ,
    );
  }
}
