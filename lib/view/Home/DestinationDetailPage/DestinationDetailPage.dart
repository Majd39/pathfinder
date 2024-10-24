import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathfinder/constant/AppCollor.dart';

import '../HomePageController.dart';

class DestinationDetailPage extends StatelessWidget {
  final String imageUrl;
  final String city;
  final String country;
  final String description;
  final HomePageController homePageController = Get.put(HomePageController());

  DestinationDetailPage({
    super.key,
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    int index = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$city, $country",
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              // Add Hero widget for smooth transition
              tag: city, // Use city as unique identifier
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Obx(() {
              // int index=0;
              var destination = homePageController.mostVisited[index];

              return Text(
                destination.descriotion,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.black,
                ),
              );
            }),
            Divider(),
            GestureDetector(
              onTap: () {
                Get.toNamed("/bookings");
              },
              child: Center(child:
              Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Text(
                    "Book Now",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),)
              ),),
            ),
          ],
        ),
      ),
    );
  }



}
