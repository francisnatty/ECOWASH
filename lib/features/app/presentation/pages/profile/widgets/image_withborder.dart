import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWithBorder extends StatelessWidget {
  const ImageWithBorder({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 70.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 0.75,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2), // Outer padding for the image
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // Adjust fit as needed
          ),
        ),
      ),
    );
  }
}
