import 'package:booking_app/utils/app_colors.dart';
import 'package:booking_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final EdgeInsetsGeometry? padding;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColorLight,
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: screenWidth * 0.3,
              vertical: screenHeight * 0.02,
            ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: Text(label, style: AppStyles.bold14White),
    );
  }
}
