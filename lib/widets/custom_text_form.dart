import 'package:booking_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  TextInputType? keyboardType;
  final TextEditingController controller;

  CustomTextForm({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: AppColors.greyColor, fontSize: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.primaryColorLight,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.redColor, width: 2.0),
        ),
      ),
    );
  }
}
