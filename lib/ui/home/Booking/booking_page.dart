import 'package:booking_app/models/booking_model.dart';
import 'package:booking_app/models/tour_model.dart';
import 'package:booking_app/providers/booking_providers.dart';
import 'package:booking_app/utils/app_colors.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:booking_app/widets/custom_button.dart';
import 'package:booking_app/widets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatefulWidget {
  BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController numberOfTravelers;
  void initState() {
    userName = TextEditingController();

    email = TextEditingController();
    numberOfTravelers = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    userName.dispose();
    email.dispose();
    numberOfTravelers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    Tour tour = ModalRoute.of(context)!.settings.arguments as Tour;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        title: Text(tour.title, style: AppStyles.bold20White),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.02,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.03),
              Text("Booking Details", style: AppStyles.semi20Primary),
              SizedBox(height: screenHeight * 0.03),
              CustomTextForm(labelText: "User Name", controller: userName),
              SizedBox(height: screenHeight * 0.03),
              CustomTextForm(labelText: "Email", controller: email),
              SizedBox(height: screenHeight * 0.03),
              CustomTextForm(
                labelText: "Numbers of travelers",
                controller: numberOfTravelers,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 80),
              CustomButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Booking submitted successfully!'),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  final booking = Booking(
                    userName: userName.text,
                    email: email.text,
                    numberOfTravelers:
                        int.tryParse(numberOfTravelers.text) ?? 1,

                    tour: tour,
                  );

                  Provider.of<BookingProvider>(
                    context,
                    listen: false,
                  ).addBooking(booking);
                  Navigator.pop(context);
                },
                label: "submission",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
