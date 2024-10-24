import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pathfinder/view/Bookings/taxi.dart';

import '../../component/Title.dart';
import '../../constant/AppCollor.dart';
import 'airline.dart';
import 'hotel.dart';

class CombinedReservationPage extends StatelessWidget {
  const CombinedReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedAirline;
    String? selectedPassengerNumber;
    String? selectedCountry;
    String? selectedCity;

    final airlines = {
      'Airline A': 300.0,
      'Airline B': 400.0,
      'Airline C': 350.0
    };
    final passengerNumber = {
      'passen0': 1,
      'passen1': 2,
      'passen2': 3,
      'passen3': 4,
      'passen4': 5
    };
    final country = {
      'country 1': "Tokyo",
      'country 2': "Paris",
      'country 3': "New York"
    };
    final city = {'city 1': "Tokyo", 'city 2': "Paris", 'city 3': "New York"};

    double calculateTotalPrice() {
      double total = 0.0;
      if (selectedAirline != null && selectedPassengerNumber != null) {
        total += (airlines[selectedAirline]! *
            passengerNumber[selectedPassengerNumber]!);
      }
      return total;
    }

    return Scaffold(
      appBar: AppBar(
        title: const CustumTitle(
            text: "Make ",
            color: AppColor.primaryColor,
            text2: "a Res",
            color2: Colors.black,
            text3: "ervation",
            color3: AppColor.primaryColor),
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.primaryColor.withOpacity(0.8), Colors.white],
          ),
        ),
        child: ListView(
          children: [
            DefaultTabController(
              length: 3,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepOrange),
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColor.primaryColor,
                      AppColor.secondaryColor,
                      Colors.white
                    ],
                  ),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                child: const Column(
                  children: [
                    TabBar(
                      indicatorColor: Colors.deepOrange,
                      labelColor: AppColor.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(icon: Icon(Icons.flight), text: "Airline"),
                        Tab(icon: Icon(Icons.local_taxi), text: "Taxi"),
                        Tab(icon: Icon(Icons.hotel), text: "Hotel"),
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: TabBarView(
                        children: [
                          ChossAirline(),
                          ChossTaxi(),
                          ChossHotel(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey),
            buildSummarySection(selectedAirline, selectedPassengerNumber,
                selectedCountry, selectedCity, calculateTotalPrice),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Get.snackbar('Success', 'Reservation completed successfully!');
              },
              child: const Text('Confirm Purchase',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummarySection(
    String? selectedAirline,
    String? selectedPassengerNumber,
    String? selectedCountry,
    String? selectedCity,
    double Function() calculateTotalPrice,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Purchase Summary:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        buildSummaryRow('Airline:', selectedAirline),
        buildSummaryRow('Number of Passengers:', selectedPassengerNumber),
        buildSummaryRow('Country:', selectedCountry),
        buildSummaryRow('City:', selectedCity),
        const SizedBox(height: 20),
        Text('Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget buildSummaryRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text('$label ${value ?? 'Not Selected'}',
          style: const TextStyle(fontSize: 18)),
    );
  }
}
