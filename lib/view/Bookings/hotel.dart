import 'package:flutter/material.dart';

class ChossHotel extends StatelessWidget {
  const ChossHotel({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedHotel;
    String? selectedRoomType;
    String? selectedStayDuration;

    final hotels = {'Hotel A': 150.0, 'Hotel B': 200.0, 'Hotel C': 250.0};
    final roomTypes = {'Single': 0.0, 'Double': 50.0, 'Suite': 100.0};
    final stayDurations = {'1 Night': 1, '2 Nights': 2, '3 Nights': 3};

    double calculateTotalPrice() {
      double total = 0.0;
      if (selectedHotel != null &&
          selectedRoomType != null &&
          selectedStayDuration != null) {
        total += (hotels[selectedHotel]! +
            roomTypes[selectedRoomType]! *
                stayDurations[selectedStayDuration]!);
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
              labelText: 'Select Hotel',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedHotel,
            items: hotels.keys.map((hotel) {
              return DropdownMenuItem<String>(
                value: hotel,
                child: Text('$hotel - \$${hotels[hotel]!.toStringAsFixed(2)}'),
              );
            }).toList(),
            onChanged: (value) {
              selectedHotel = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Room Type',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedRoomType,
            items: roomTypes.keys.map((roomType) {
              return DropdownMenuItem<String>(
                value: roomType,
                child: Text(
                    '$roomType - \$${roomTypes[roomType]!.toStringAsFixed(2)}'),
              );
            }).toList(),
            onChanged: (value) {
              selectedRoomType = value;
              (context as Element).markNeedsBuild();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Select Stay Duration',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            value: selectedStayDuration,
            items: stayDurations.keys.map((duration) {
              return DropdownMenuItem<String>(
                value: duration,
                child: Text(duration),
              );
            }).toList(),
            onChanged: (value) {
              selectedStayDuration = value;
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
