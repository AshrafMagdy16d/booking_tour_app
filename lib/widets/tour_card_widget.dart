import 'package:booking_app/models/tour_model.dart';
import 'package:booking_app/utils/app_colors.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TourCard extends StatelessWidget {
  final Tour tour;
  final VoidCallback? onTap;
  final Widget? extraInfo;
  final Widget? trailing;

  const TourCard({
    super.key,
    required this.tour,
    this.onTap,
    this.extraInfo,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.whiteColor,
        elevation: 4,
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.02,
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: CachedNetworkImage(
                imageUrl: tour.imageUrl,
                height: screenHeight * 0.25,
                width: double.infinity,
                fit: BoxFit.fill,
                errorWidget:
                    (context, url, error) =>
                        const Icon(Icons.error_outline_outlined),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tour.title, style: AppStyles.bold20Primary),
                  const SizedBox(height: 8),
                  Text("\$${tour.price.toInt()}", style: AppStyles.bold16Black),
                  const SizedBox(height: 8),
                  Text(
                    tour.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyles.semi14gray,
                  ),
                  if (extraInfo != null) ...[
                    const SizedBox(height: 10),
                    const Divider(),
                    extraInfo!,
                  ],
                  if (trailing != null)
                    Align(alignment: Alignment.bottomRight, child: trailing!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
