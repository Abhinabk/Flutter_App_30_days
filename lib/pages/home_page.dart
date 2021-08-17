import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/widgets/drawer.dart';
import 'package:flutter_catelog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  // final String name  = "Abhinab";
  final String fullName = "Abhinab Krishnatraya";

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
          child: ListView.builder(
            itemCount: CatelogModel.items.length,
            itemBuilder: (context,index){
              return ItemWidget(item: CatelogModel.items[index],);
            },
          ),
        ),
        drawer: MyDrawer(),
      );
      
  }
}