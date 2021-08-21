
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_catelog/core/store.dart';
import 'package:flutter_catelog/models/cart.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/utils/routes.dart';
import 'package:flutter_catelog/widgets/home_widgets/catelog_header.dart';
import 'package:flutter_catelog/widgets/home_widgets/catelog_list.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String fullName = "Abhinab Krishnatraya";
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    // var catelogJson = await rootBundle.loadString("assets/files/catalog.json");
    // get the files from the api network
    final response = await http.get(Uri.parse(url));

    final catelogJson = response.body;

   final decodedData = jsonDecode(catelogJson);
    var productsData = decodedData['products'];
    CatelogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return
      Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation,RemoveMutation},
        builder:(context,_,status)=> FloatingActionButton
        (onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
        child: Icon(CupertinoIcons.cart,color: Colors.white,
        )
        ).badge(color: Vx.red500,position: VxBadgePosition.rightTop,size: 20,
        count: _cart.items.length,textStyle: TextStyle(color: Colors.black,fontWeight:FontWeight.bold)),
      ),
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




