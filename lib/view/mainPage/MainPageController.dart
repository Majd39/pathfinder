import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Bookings/bookings.dart';
import '../Favorate/favorite.dart';
import '../Home/HomePage.dart';

class MainPageController extends GetxController {
  int selectedIndex = 0;

  final List<Widget> pages = [
     HomePage(), // The HomePage widget
    const CombinedReservationPage(), // The Combined Reservation & Purchase Page widget
    const FavoritePage(), // The Favorites page widget
  ];

  void changePage(int index) {
    selectedIndex = index;
    update(); // Triggers a rebuild to update the displayed page
  }
}
