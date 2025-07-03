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
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
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
              height: screenHeight * 0.3,
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenHeight * 0.01,
              ),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tour.title, style: AppStyles.semi20Black),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "\$${tour.price.toInt()}",
                      style: AppStyles.bold20Primary,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(tour.description, style: AppStyles.semi18gray),
                    SizedBox(height: screenHeight * 0.2),
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
            ),
          ],
        ),
      ),
    );
  }
}
