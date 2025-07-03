import 'package:booking_app/models/tour_model.dart';

class Booking {
  final String userName;
  final String email;
  final int numberOfTravelers;
  final Tour tour;

  Booking({
    required this.userName,
    required this.email,
    required this.numberOfTravelers,
    required this.tour,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'numberOfTravelers': numberOfTravelers,
      'tour': tour.toJson(),
    };
  }

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      userName: json['userName'],
      email: json['email'],
      numberOfTravelers: json['numberOfTravelers'],
      tour: Tour.fromJson(json['tour']),
    );
  }
}
