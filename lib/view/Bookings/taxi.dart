import 'package:flutter/material.dart';

class ChossTaxi extends StatelessWidget {
  const ChossTaxi({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedTaxi;
    String? selectedDestination;
    String? selectedPickupTime;

    final taxis = {'Taxi A': 50.0, 'Taxi B': 60.0, 'Taxi C': 70.0};
    final destinations = {
      'Destination 1': 20.0,
      'Destination 2': 30.0,
      'Destination 3': 40.0
    };
    final pickupTimes = {'Morning': 0.0, 'Afternoon': 5.0, 'Evening': 10.0};

    double calculateTotalPrice() {
      double total = 0.0;
      if (selectedTaxi != null &&
          selectedDestination != null &&
          selectedPickupTime != null) {
        total += (taxis[selectedTaxi]! +
            destinations[selectedDestination]! +
            pickupTimes[selectedPickupTime]!);
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
              labelText: 'Select Taxi',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedTaxi,
            items: taxis.keys.map((taxi) {
              return DropdownMenuItem<String>(
                value: taxi,
                child: Text('$taxi - \$${taxis[taxi]!.toStringAsFixed(2)}'),
              );
            }).toList(),
            onChanged: (value) {
              selectedTaxi = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Destination',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedDestination,
            items: destinations.keys.map((destination) {
              return DropdownMenuItem<String>(
                value: destination,
                child: Text(
                    '$destination - \$${destinations[destination]!.toStringAsFixed(2)}'),
              );
            }).toList(),
            onChanged: (value) {
              selectedDestination = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Pickup Time',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedPickupTime,
            items: pickupTimes.keys.map((time) {
              return DropdownMenuItem<String>(
                value: time,
                child:
                    Text('$time - \$${pickupTimes[time]!.toStringAsFixed(2)}'),
              );
            }).toList(),
            onChanged: (value) {
              selectedPickupTime = value;
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
