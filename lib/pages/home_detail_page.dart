
import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/catelog.dart';
import 'package:flutter_catelog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter_catelog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {

  final Item catelog;

  const HomeDetailPage({Key? key,required this.catelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor:context.canvasColor,
      bottomNavigationBar: 
           Container(
             color: context.cardColor,
             child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: Vx.mOnly(right: 16),
                    children: [
                      "\$${catelog.price}".text.bold.xl4.red800.make(),
           AddToCart(catelog: catelog).wh(120,60),
                    ],
                  ).py32(),
           )
      ,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [

          Hero(
            tag: Key(catelog.id.toString()),
            child: Image.network(catelog.image)).h32(context),
          Expanded(child: VxArc(
            height: 30.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children:[catelog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                catelog.desc.text.xl.make(),
                10.heightBox,
                "Et amet amet eos ea vero. Consetetur at ipsum vero sit et justo ipsum dolor, lorem tempor dolores consetetur ut, amet sit amet ipsum voluptua eos dolor amet. Et labore consetetur elitr no diam dolor takimata voluptua, rebum nonumy rebum eirmod rebum amet. No et sed duo eirmod et diam."
                .text.make().p16(),
                ]
                ).py64(),
            ),
          ))
        ],),
      ),
    );
  }
}