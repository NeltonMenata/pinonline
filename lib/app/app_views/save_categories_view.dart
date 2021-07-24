import 'package:flutter/material.dart';
import 'app_components/home_components/app_bottom_bar.dart';
import 'app_components/save_components/save_form.dart';

class SaveCategorieView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.save), onPressed: () {})],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue, Colors.white])),
          child: FormSave()),
      bottomNavigationBar: bottomAppBar()
    );
  }
}
