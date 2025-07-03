import 'package:booking_app/mock/mock_data.dart';

import 'package:booking_app/utils/app_colors.dart';
import 'package:booking_app/utils/app_routes.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:booking_app/widets/tour_card_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        title: Text("Booking Tour App", style: AppStyles.bold20White),
        actions: [
          IconButton(
            icon: Icon(Icons.card_travel_outlined, color: AppColors.whiteColor),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.tourBookedRouteName);
            },
          ),
        ],
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              itemCount: mockTours.length,
              itemBuilder: (context, index) {
                final tour = mockTours[index];
                return TourCard(
                  tour: tour,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.tourDetailsRouteName,
                      arguments: tour,
                    );
                  },
                );
              },
            );
          } else {
            return ListView.builder(
              itemCount: mockTours.length,
              itemBuilder: (context, index) {
                final tour = mockTours[index];
                return TourCard(
                  tour: tour,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.tourDetailsRouteName,
                      arguments: tour,
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
