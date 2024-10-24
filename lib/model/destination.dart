class Destination {
  String imageUrl;
  String city;
  String country;
 String descriotion;
  Destination({required this.imageUrl, required this.city, required this.country,required this.descriotion});

  // Factory method to create a Destination from Firestore data
  factory Destination.fromFirestore(Map<String, dynamic> data) {
    return Destination(
      imageUrl: data['imageUrl'] ?? '',
      city: data['city'] ?? '',
      country: data['country'] ?? '',
      descriotion:data['descriotion']?? '',
    );
  }
}
