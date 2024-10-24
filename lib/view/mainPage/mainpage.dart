import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathfinder/constant/AppCollor.dart';

import 'MainPageController.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // MainPageController mainPageController=Get.find();
    return Scaffold(
      body: GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (controller) {
          return controller.pages[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        selectedFontSize:16 ,
        backgroundColor: AppColor.primaryColor,
        currentIndex: Get.find<MainPageController>().selectedIndex,
        onTap: (index) {
          Get.find<MainPageController>().changePage(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
