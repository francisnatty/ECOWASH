import 'package:flutter/material.dart';

import 'add_item_widget.dart';

class ServiceTab extends StatefulWidget {
  const ServiceTab({super.key});

  @override
  State<ServiceTab> createState() => _ServiceTabState();
}

class _ServiceTabState extends State<ServiceTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 10,
          // mainAxisSpacing: 10,
        ),
        itemCount: 10, // Replace with your actual item count
        itemBuilder: (context, index) {
          return const AddItemWidget();
        });
  }
}
