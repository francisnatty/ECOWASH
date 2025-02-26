import 'package:ecowash/features/app/presentation/pages/cart/screens/cart.dart';
import 'package:ecowash/features/app/presentation/pages/dashboard/dashboard.dart';
import 'package:ecowash/features/app/presentation/pages/laundry/screens/product_details.dart';
import 'package:ecowash/features/app/presentation/pages/profile/screens/profile.dart';
import 'package:ecowash/features/app/presentation/pages/wallet/screens/wallet.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class HomeNav extends StatefulWidget {
  final int? index;
  const HomeNav({super.key, this.index});

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const DashboardSc(),
    const CartScreen(),
    const CartScreen(),
    const WalletSc(),
    const Profile(),
  ];

  @override
  void initState() {
    if (widget.index != null) {
      _selectedIndex = widget.index!;
    }

    fetchAllOrders(context);
    //  context.read<OrderBloc>().add(GetOrdersEvent());
    super.initState();
  }

  void fetchAllOrders(BuildContext context) {
    // context.read<ProductBloc>().add(GetProducts());
    // context.read<OrderBloc>().add(GetOrdersEvent());
    // context.read<OrderBloc>().add(GetRequestedOrdersEvent());
    // context.read<OrderBloc>().add(GetCompletedOrdersEvent());
    // context.read<OrderBloc>().add(GetActiveOrdersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onpressed: _onItemTapped,
      ),
    );
  }
}
