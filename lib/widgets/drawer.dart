import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  final imageUrl =
   "https://images.unsplash.com/photo-1528892952291-009c663ce843?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountName: Text("Abhinab"),
                accountEmail: Text("abhi@gmail.com"),
                // currentAccountPicture: Image.network(imageUrl), for rectangular
                currentAccountPicture: CircleAvatar(
                  
                  backgroundImage:NetworkImage(imageUrl)),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home,color: Colors.white),
                title: Text("Home",style: TextStyle(color: Colors.white),textScaleFactor: 1.3,),
                
              ),
              ListTile(
                leading: Icon(CupertinoIcons.profile_circled,color: Colors.white),
                title: Text("Profile",style: TextStyle(color: Colors.white),textScaleFactor: 1.3,),
                
              ),  
              ListTile(
                leading: Icon(CupertinoIcons.mail,color: Colors.white),
                title: Text("Mail",style: TextStyle(color: Colors.white),textScaleFactor: 1.3,),
                
              ),
          
          ],
        ),
      ),
    );
  }
}