import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catelog/models/catelog.dart';
// import 'package:flutter_catelog/widgets/drawer.dart';
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
                CatelogList().expand()
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

class CatelogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
       Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Catelog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
              "Trending Products".text.xl2.bold.make(),
            ],
    );
  }
}

class CatelogList extends StatelessWidget {
  const CatelogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatelogModel.items!.length,
      itemBuilder: (context,index){
      final catelog = CatelogModel.items![index];
      return CatelogItem(catelog:catelog);
      
    });
  }
}

class CatelogItem extends StatelessWidget {

  final Item catelog;

  const CatelogItem({Key? key,required this.catelog}) :super(key: key);


  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatelogImage(
            image: catelog.image
            ),
            Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catelog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
                catelog.desc.text.make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mOnly(right: 16),
                  children: [
                    "\$${catelog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: (){}, child: "Buy".text.make(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                    
                        shape: MaterialStateProperty.all(StadiumBorder())
                        ),

                      )
                  ],
                )
              ],
            ))
        ],
      )
    ).white.roundedLg.square(150).make().py16();
  }
}
class CatelogImage extends StatelessWidget {
  final String image;

  const CatelogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
            image,
            ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}