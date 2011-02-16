import 'package:flutter/material.dart';
import 'package:pinonline/app/app_views/_size/size.dart';

class Header extends StatefulWidget {

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
            delegate: SliverChildListDelegate([
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: alturaPor(15, context),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(45)),
                    boxShadow: [BoxShadow(blurRadius: 3)]
                    ),
                  ),
                ],
              )
            ]),
          );
  }
}