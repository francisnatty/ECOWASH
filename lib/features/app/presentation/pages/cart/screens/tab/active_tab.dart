import 'package:ecowash/core/widgets/spacing.dart';
import 'package:ecowash/features/app/presentation/pages/cart/widgets/active_order_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActiveTab extends StatefulWidget {
  const ActiveTab({super.key});

  @override
  State<ActiveTab> createState() => _ActiveTabState();
}

class _ActiveTabState extends State<ActiveTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const Hspacing(height: 20);
        },
        itemBuilder: (context, index) {
          return const ActiveOrderWidget();
        });
  }
}
