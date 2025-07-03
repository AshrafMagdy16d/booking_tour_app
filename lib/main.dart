import 'package:booking_app/providers/booking_providers.dart';
import 'package:booking_app/ui/home/Booking/booking_page.dart';
import 'package:booking_app/ui/home/Booking/my_booking_page.dart';
import 'package:booking_app/ui/home/home_screen.dart';
import 'package:booking_app/ui/home/tour/tour_details.dart';
import 'package:booking_app/utils/app_routes.dart';
import 'package:booking_app/widets/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => BookingProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.tourDetailsRouteName: (context) => TourDetailsPage(),
        AppRoutes.bookingRouteName: (context) => BookingPage(),
        AppRoutes.tourBookedRouteName: (context) => TourBooked(),
      },
    );
  }
}
