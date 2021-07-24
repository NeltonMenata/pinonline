import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerAccount extends StatelessWidget {
  String imgAccount =
      "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/218271205_349478283509000_3028249886665315534_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeF7XKRDN4AEWBmaquM9pW0POBFdOTuySng4EV05O7JKeFKbOhhm8_faPLGdGvwig4d7ieRKKh6ERumR4kUtL-kb&_nc_ohc=gjx98vzxzPcAX_OgA0R&_nc_ad=z-m&_nc_cid=1390&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=a46dfae2fcd542c917634c373c59f689&oe=611F47F0";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        UserAccountsDrawerHeader(
            currentAccountPictureSize: Size.square(80),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.green,
                child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.black,
                    backgroundImage: NetworkImage(imgAccount))),
            accountName: Text("Nelton Menata"),
            accountEmail: Text("neltonmenataditec@gmail.com")),
        ListTile(
          leading: Icon(Icons.account_box),
          title: Text("Current Account"),
          subtitle: Text("subtitle"),
          onTap: () {},
        )
      ]),
    );
  }
}
