import 'package:flutter/material.dart';

class ChossAirline extends StatelessWidget {
  const ChossAirline({super.key});

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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Airline',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedAirline,
            items: airlines.keys.map((airline) {
              return DropdownMenuItem<String>(
                value: airline,
                child: Text(
                    '$airline - \$${airlines[airline]!.toStringAsFixed(2)}'),
              );
            }).toList(),
            onChanged: (value) {
              selectedAirline = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Passenger Number',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedPassengerNumber,
            items: passengerNumber.keys.map((number) {
              return DropdownMenuItem<String>(
                value: number,
                child: Text('$number - ${passengerNumber[number]!.toString()}'),
              );
            }).toList(),
            onChanged: (value) {
              selectedPassengerNumber = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Country',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedCountry,
            items: country.keys.map((country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text('$country }'),
              );
            }).toList(),
            onChanged: (value) {
              selectedCountry = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select City',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedCity,
            items: city.keys.map((city) {
              return DropdownMenuItem<String>(
                value: city,
                child: Text('$city '),
              );
            }).toList(),
            onChanged: (value) {
              selectedCity = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
