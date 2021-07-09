import 'package:flutter/material.dart';

class DrawerAccount extends StatelessWidget {
  const DrawerAccount({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(),
            accountName: Text("Nelton Menata"), 
            accountEmail: Text("neltonmenataditec@gmail.com")),
          ListTile(leading: Icon(Icons.account_box),title: Text("Current Account"), subtitle: Text("subtitle"),onTap: (){},)
        ]
      ),
    );
  }
}