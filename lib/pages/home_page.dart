import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/widgets/home_widgets/catelog_header.dart';
import 'package:flutter_catelog/widgets/home_widgets/catelog_list.dart';
// import 'package:flutter_catelog/widgets/item_widget.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String fullName = "Abhinab Krishnatraya";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    var catelogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catelogJson);
    var productsData = decodedData['products'];
    CatelogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor:MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatelogHeader(),
              if (CatelogModel.items != null && CatelogModel.items!.isNotEmpty )
                CatelogList().py16().expand()
              else
                Center(
                  child:  CircularProgressIndicator(),
                )
              
            ],
          ),
        ),
      ),
    );  
  }
}




