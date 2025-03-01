import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';

class DesignWidget extends StatelessWidget {
  final String title;
  final String description;
  const DesignWidget(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            AppImages.onbBg,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 80,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
