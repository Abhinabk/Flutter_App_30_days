import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/widgets/drawer.dart';
import 'package:flutter_catelog/widgets/item_widget.dart';
import 'dart:convert';
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
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatelogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(

        appBar: AppBar(
          title: Text("Cateloge App",),
        ),
        // using builder as items render only when scrolled
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:(CatelogModel.items!=null && CatelogModel.items!.isNotEmpty )? ListView.builder(
            itemCount: CatelogModel.items!.length,
            itemBuilder: (context,index){
              return ItemWidget(item: CatelogModel.items![index],);
            },
          ):Center(child: 
          CircularProgressIndicator(),),
        ),
        drawer: MyDrawer(),
      );
      
  }
}