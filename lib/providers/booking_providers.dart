import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:booking_app/models/booking_model.dart';
import 'package:booking_app/widets/cache_helper.dart';

class BookingProvider extends ChangeNotifier {
  List<Booking> bookingTour = [];

  List<Booking> get bookings => bookingTour;

  void loadBookings() {
    final data = CacheHelper.getData(key: 'bookings');
    if (data != null) {
      final List decoded = jsonDecode(data);
      bookingTour = decoded.map((e) => Booking.fromJson(e)).toList();
      notifyListeners();
    }
  }

  BookingProvider() {
    loadBookings();
  }

  void addBooking(Booking booking) {
    bookingTour.add(booking);
    saveBookings();
    notifyListeners();
  }

  void deleteBooking(int index) {
    bookingTour.removeAt(index);
    saveBookings();
    notifyListeners();
  }

  void saveBookings() {
    final data = jsonEncode(bookingTour.map((e) => e.toJson()).toList());
    CacheHelper.saveData(key: 'bookings', value: data);
  }
}
