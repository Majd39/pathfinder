import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/destination.dart';// Import the Destination model


class HomePageController extends GetxController {
  // Observables to manage data reactivity
  RxList<Destination> destinations = <Destination>[].obs;
  RxList<Destination> mostVisited = <Destination>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchDestinations();
  }

  void fetchDestinations() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('destinations').get();
      List<Destination> loadedDestinations = querySnapshot.docs.map((doc) {
        return Destination.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();

      destinations.assignAll(loadedDestinations);

      // Dummy filter for 'most visited' (could be based on visits or another field)
      mostVisited.assignAll(loadedDestinations.take(5).toList());
    } catch (e) {
      print('Error fetching destinations: $e');
    }
  }
}
