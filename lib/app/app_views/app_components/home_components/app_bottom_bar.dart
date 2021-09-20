import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/app_controller/home_controller.dart';
import '/app/app_views/app_routes/routes.dart';

int currentPage = 0;

BottomAppBar bottomAppBar() {
  return BottomAppBar(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.green.shade600,
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              currentPage = 0;
              Get.toNamed(Routes.HOME);
            },
            icon: Icon(
              Icons.home,
              color: currentPage == 0 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
          IconButton(
            onPressed: () {
              currentPage = 1;},
            icon: Icon(
              Icons.book,
              color: currentPage == 1 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
          IconButton(
            onPressed: () {
              currentPage = 2;
            },
            icon: Icon(
              Icons.notifications,
              color: currentPage == 2 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
          IconButton(
            onPressed: () {
              currentPage = 3;
            },
            icon: Icon(
              Icons.settings,
              color: currentPage == 3 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
        ],
      ),
    ),

  );
}

BottomAppBar bottomAppBarOthers() {
  return BottomAppBar(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.green.shade600,
      height: 80,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              currentPage = 0;
              Get.back();
              Get.toNamed(Routes.HOME);
            },
            icon: Icon(
              Icons.home,
              color: currentPage == 0 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
          IconButton(
            onPressed: () {
              currentPage = 1;
            },
            icon: Icon(
              Icons.book,
              color: currentPage == 1 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
          IconButton(
            onPressed: () {
              currentPage = 2;
            },
            icon: Icon(
              Icons.notifications,
              color: currentPage == 2 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
          IconButton(
            onPressed: () {
              currentPage = 3;
            },
            icon: Icon(
              Icons.settings,
              color: currentPage == 3 ? Colors.black : Colors.white,
            ),
            iconSize: 45,
          ),
        ],
      ),
    ),

  );
}


    /*Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.home,
            color: currentPage == 0 ? Colors.blue : Colors.black87,
          ),
          onPressed: () {
            currentPage = 0;
            Get.toNamed(Routes.HOME);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.add_circle_outline_rounded,
            color: currentPage == 0 ? Colors.black : Colors.white,
          ),
          onPressed: () {
            currentPage = 1;
            Get.toNamed(Routes.SAVE);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: currentPage == 0 ? Colors.black : Colors.white,
          ),
          onPressed: () {
            currentPage = 2;
            Get.toNamed(Routes.DELETE);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.data_saver_on_rounded,
            color: currentPage == 0 ? Colors.black : Colors.white,
          ),
          onPressed: () {
            
            Get.to(()=>BancoDeDadosView());
          },
        ),
      ],
    ),*/

/*

Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                color: Colors.green.shade600,
                height: 80,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home,
                      color: currentPage == 0 ? Colors.black : Colors.white,),
                      iconSize: 45,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.book,
                      color: currentPage == 0 ? Colors.black : Colors.white,),
                      iconSize: 45,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications,
                      color: currentPage == 0 ? Colors.black : Colors.white,),
                      iconSize: 45,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings,
                        color: currentPage == 0 ? Colors.black : Colors.white,
                      ),
                      iconSize: 45,
                    ),
                  ],
                ),
              ),

*/
get _to => HomeController.controller;

BottomAppBar bottomAppBarBack() {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.black87,
          ),
          onPressed: () {
            currentPage = 0;

            Get.back();
            _to.atualizaHome();
          },
        ),
      ],
    ),
  );
}
