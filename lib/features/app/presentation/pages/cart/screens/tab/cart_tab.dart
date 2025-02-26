import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/wwidgets.dart';
import '../../widgets/cart_widget.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const Hspacing(height: 20);
        },
        itemBuilder: (context, index) {
          return const CartWidget();
        });
  }
}
