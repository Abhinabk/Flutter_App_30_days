import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  // final String name  = "Abhinab";
  final String fullName = "Abhinab Krishnatraya";

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Cateloge App"),
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to $days days by $fullName"),
            ),
        ),
        drawer: Drawer(),
      );
  }
}