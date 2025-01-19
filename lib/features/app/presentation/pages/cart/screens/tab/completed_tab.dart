import 'package:ecowash/features/app/presentation/pages/cart/widgets/completed_order_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../../../core/widgets/wwidgets.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({super.key});

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const Hspacing(height: 20);
        },
        itemBuilder: (context, index) {
          return const CompletedOrderWidget();
        });
  }
}
