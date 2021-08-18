import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_catelog/models/catelog.dart';
class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key, required this.item}) : 
  super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
          textScaleFactor: 1.6,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}