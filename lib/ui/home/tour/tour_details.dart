import 'package:booking_app/models/tour_model.dart';

import 'package:booking_app/utils/app_colors.dart';
import 'package:booking_app/utils/app_routes.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:booking_app/widets/custom_button.dart';
import 'package:flutter/material.dart';

class TourDetailsPage extends StatelessWidget {
  TourDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Tour tour = ModalRoute.of(context)!.settings.arguments as Tour;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        title: Text(tour.title, style: AppStyles.bold20White),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              tour.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tour.title, style: AppStyles.semi20Black),
                  const SizedBox(height: 8),
                  Text(
                    "\$${tour.price.toInt()}",
                    style: AppStyles.bold20Primary,
                  ),
                  const SizedBox(height: 16),
                  Text(tour.description, style: AppStyles.semi18gray),
                  const SizedBox(height: 120),
                  Center(
                    child: CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.bookingRouteName,
                          arguments: Tour(
                            id: tour.id,
                            title: tour.title,
                            imageUrl: tour.imageUrl,
                            price: tour.price,
                            description: tour.description,
                          ),
                        );
                      },
                      label: "Book Now",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
