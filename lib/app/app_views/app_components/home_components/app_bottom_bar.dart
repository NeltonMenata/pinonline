import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/app_views/app_routes/routes.dart';

int currentPage = 0;

BottomAppBar bottomAppBar() {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            color: currentPage == 1 ? Colors.blue : Colors.black87,
          ),
          onPressed: () {
            currentPage = 1;
            Get.toNamed(Routes.SAVE);
          },
        ),
        IconButton(
          icon: Icon(
            Icons.delete,
            color: currentPage == 2 ? Colors.blue : Colors.black87,
          ),
          onPressed: () {
            currentPage = 2;
            Get.toNamed(Routes.DELETE);
          },
        ),
      ],
    ),
  );
}
