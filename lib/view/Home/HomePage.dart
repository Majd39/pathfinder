import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../component/DestinationCard.dart';
import '../../component/Title.dart';
import '../../constant/AppCollor.dart';
import 'HomePageController.dart'; // Import the controller

class HomePage extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

   HomePage({super.key}); // Initialize the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const CustumTitle(
          text: 'Explo',
          text2: 'r The w',
          text3: 'orld',
          color: Colors.black,
          color2: AppColor.white,
          color3: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: AppColor.lightSecondary,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   const SizedBox(height: 20),

                // Search Bar
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                     const Icon(Icons.search, color: Colors.grey),
                   const   SizedBox(width: 10),
                      Text(
                        "Search destinations...",
                        style: GoogleFonts.lato(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                 const SizedBox(height: 30),

                // Most Visited List (Scroll horizontally)
                Text(
                  "Most Visited",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const  SizedBox(height: 10),
                SizedBox(
                  height: 150, // Fixed height for horizontal list
                  child: Obx(() {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homePageController.mostVisited.length,
                      itemBuilder: (context, index) {
                        var destination = homePageController.mostVisited[index];
                        return DestinationCard(
                          imageUrl: destination.imageUrl,
                          city: destination.city,
                          country: destination.country,
                        );
                      },
                    );
                  }),
                ),
                const    SizedBox(height: 20),

                // Popular Destinations Grid
                Text(
                  "Popular Destinations",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const  SizedBox(height: 15),

                // Destination Grid
                Expanded(
                  child: Obx(() {
                    return GridView.builder(
                      itemCount: homePageController.destinations.length,
                      itemBuilder: (context, index) {
                        var destination = homePageController.destinations[index];
                        return DestinationCard(
                          imageUrl: destination.imageUrl,
                          city: destination.city,
                          country: destination.country,
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: constraints.maxWidth > 600 ? 3 : 2, // Responsive grid
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Code to add a destination
        },
        child:const  Text("Add destination"),
      ),
    );
  }
}


