import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_controller.dart/home_controller.dart';
import 'app_components/home_components/drawer_component.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    
    HomeController controller = Get.put(HomeController());
    double widthScreen = MediaQuery.of(context).size.width;
    // ignore: unused_local_variable
    double heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      
      appBar: AppBar(
        
        centerTitle: true,
        title: Text("JustBuild"),
        actions: [Image.asset("assets/img/logo.png", width: 70,)],
        foregroundColor: Colors.green,
      ),
      drawer: DrawerAccount(),
      body: Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: widthScreen * 0.8,
              decoration: BoxDecoration(
                border: Border.all()
              ),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                ),
              ),
             IconButton(icon: Icon(Icons.search), onPressed: (){},)
            ],
        ),
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: controller.categoria.length,
            itemBuilder: (context, i){
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){print("apertado");},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * (45/100),
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset("assets/img/logo.png"),
                                SizedBox(height: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width * (45/100),
                                  color: Colors.amber,
                                  child: Text(controller.categoria.elementAt(i).nome, 
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                                ),
                            
                            ],),
                          ),
                        ),
                        Container(
                          
                          width: MediaQuery.of(context).size.width * (45/100),
                          child: Column(
                            children: [
                              Text("Descrição da Categoria dos Profissionais da Pinonline")
                  
                          ],),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 1,
                      color: Colors.black38),
                  )
                ],
              );},),)
        ],),
      ),
    );

  }

}