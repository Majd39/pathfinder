import 'package:get/get.dart';

class ReservationController extends GetxController {
  // var selectedAirline = Rx<Airline?>(null);
  // var selectedHotel = Rx<Hotel?>(null);
  // var selectedTaxiCompany = Rx<TaxiCompany?>(null);
  //
  // List<Airline> airlines = [];
  // List<Hotel> hotels = [];
  // List<TaxiCompany> taxiCompanies = [];
  //
  // // Fetch data from backend (Simulated here)
  // void fetchOptions() async {
  //   // Replace with your API calls
  //   await Future.delayed(Duration(seconds: 2));
  //   airlines = [
  //     Airline(name: 'Airline A', price: 300.0),
  //     Airline(name: 'Airline B', price: 400.0),
  //     Airline(name: 'Airline C', price: 350.0),
  //   ];
  //   hotels = [
  //     Hotel(name: 'Hotel X', price: 150.0),
  //     Hotel(name: 'Hotel Y', price: 200.0),
  //     Hotel(name: 'Hotel Z', price: 180.0),
  //   ];
  //   taxiCompanies = [
  //     TaxiCompany(name: 'Taxi 1', price: 50.0),
  //     TaxiCompany(name: 'Taxi 2', price: 70.0),
  //     TaxiCompany(name: 'Taxi 3', price: 60.0),
  //   ];
  //   update(); // Notify the UI to rebuild with the new data
  // }
  //
  // // Calculate total price
  // double get totalPrice {
  //   double total = 0.0;
  //   if (selectedAirline.value != null) total += selectedAirline.value!.price;
  //   if (selectedHotel.value != null) total += selectedHotel.value!.price;
  //   if (selectedTaxiCompany.value != null)
  //     total += selectedTaxiCompany.value!.price;
  //   return total;
  // }
  //
  // @override
  // void onInit() {
  //   fetchOptions(); // Fetch options when the controller is initialized
  //   super.onInit();
  // }
}
