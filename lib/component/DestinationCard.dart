import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/Home/DestinationDetailPage/DestinationDetailPage.dart';

class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String city;
  final String country;
  final  String description; // Add description property

   const DestinationCard({super.key,
    required this.imageUrl,
    required this.city,
    required this.country,
    this.description="",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Detail Page on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinationDetailPage(
              imageUrl: imageUrl,
              city: city,
              country: country,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        width: 300,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                "$city, $country",
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}