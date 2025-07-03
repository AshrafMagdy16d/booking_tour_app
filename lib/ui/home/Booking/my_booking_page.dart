import 'package:booking_app/providers/booking_providers.dart';
import 'package:booking_app/utils/app_colors.dart';
import 'package:booking_app/utils/app_routes.dart';
import 'package:booking_app/utils/app_styles.dart';

import 'package:booking_app/widets/tour_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TourBooked extends StatelessWidget {
  TourBooked({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);
    final bookings = bookingProvider.bookings;

    return Scaffold(
      backgroundColor: AppColors.whiteColor,

      appBar: AppBar(
        title: Text('My Bookings', style: AppStyles.bold20White),
        backgroundColor: AppColors.primaryColorLight,
      ),
      body:
          bookings.isEmpty
              ? Center(
                child: Text('No bookings found.', style: AppStyles.bold16Black),
              )
              : ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return TourCard(
                    tour: booking.tour,

                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.tourDetailsRouteName,
                        arguments: booking.tour,
                      );
                    },
                    extraInfo: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User: ${booking.userName}",
                          style: AppStyles.semi14gray,
                        ),
                        Text(
                          "Email: ${booking.email}",
                          style: AppStyles.semi14gray,
                        ),
                        Text(
                          "Travelers: ${booking.numberOfTravelers}",
                          style: AppStyles.semi14gray,
                        ),
                      ],
                    ),
                    trailing: TextButton.icon(
                      onPressed: () => bookingProvider.deleteBooking(index),
                      icon: Icon(Icons.delete, color: AppColors.redColor),
                      label: Text(
                        "Delete",
                        style: TextStyle(color: AppColors.redColor),
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
