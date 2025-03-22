// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:ecowash/core/utils/utils.dart';
import 'package:ecowash/features/app/data/model/geolocation/update_location.dart';
import 'package:ecowash/features/app/presentation/sm/geolocation/geolocation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecowash/core/widgets/wwidgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../../sm/collection/bloc/collection_bloc.dart';
import 'widgets/collection_list.dart';
import 'widgets/discount_widget.dart';

class DashboardSc extends StatefulWidget {
  const DashboardSc({super.key});

  @override
  State<DashboardSc> createState() => _DashboardScState();
}

class _DashboardScState extends State<DashboardSc> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _loadData();

    super.initState();
  }

  _loadData() {
    context.read<CollectionBloc>().add(GetCollectionsEvent());
    _updateLocation();
  }

  _updateLocation() async {
    LocationService serv = LocationService();
    DeviceInfoService device = DeviceInfoService();

    Position position = await serv.getLocation();
    LocationDetails details = await serv.getLocationDetails(position);
    String? ipAddress = await serv.getIpAddress();
    String? deviceName = await device.getDeviceName();
    final provider = Provider.of<GeolocationProvider>(context, listen: false);

    final payload = LocationPayload(
      userId: '17b6de04-7a77-4fda-8d12-2616beff08f9',
      latitude: position.latitude,
      longitude: position.longitude,
      city: details.city,
      state: details.state,
      country: details.country,
      deviceName: deviceName,
      ip: ipAddress,
    );

    DebugLogger.log('Location', payload.toString());

    if (!mounted) return;
    provider.updateLocation(context: context, payload: payload);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemHeight = 100.h;
    //final calculatedGridViewHeight = itemHeight * (items.length / 2.2).ceil();

    return Scaffold(
      backgroundColor: AppColors.materialThemeWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppPaddings.all16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Text(
                          'Current Location',
                          style: AppTextStyles.bodySmaller.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SvgIcon(icon: AppIcons.location),
                          const Wspacing(width: 3),
                          Text(
                            'Kaduna,Nigeria',
                            style: AppTextStyles.labelMedium.copyWith(
                                color: AppColors.onSurface,
                                fontWeight: FontWeight.w600),
                          ),
                          const Wspacing(width: 3),
                          const SvgIcon(icon: AppIcons.dropIcon),
                        ],
                      )
                    ],
                  ),
                  const SvgIcon(
                    height: 32,
                    width: 32,
                    icon: AppIcons.notification,
                  ),
                ],
              ),
              const Hspacing(height: 15),
              Text(
                'Hi There.',
                style: AppTextStyles.titleLarge.copyWith(
                  color: AppColors.onBackground,
                ),
              ),
              const Hspacing(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFields.iconTextField(
                      hintText: 'Search here',
                      controller: searchController,
                      iconPath: AppIcons.search,
                    ),
                  ),
                  const Wspacing(width: 5),
                  SvgIcon(
                    height: 50.h,
                    width: 50.h,
                    icon: AppIcons.filter,
                  )
                ],
              ),
              const Hspacing(height: 10),
              Text(
                'Services',
                style: AppTextStyles.titleSmall,
              ),
              const Hspacing(height: 15),
              const CollectionListWidget(),
              const DashboardDiscountWidget(),
              const Hspacing(height: 15),
              Text(
                'Near you',
                style: AppTextStyles.titleSmall,
              ),
              const Hspacing(height: 15),
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40.r,
                              backgroundImage: const AssetImage(
                                AppImages.laundryShop,
                              ),
                            ),
                            const Hspacing(height: 10),
                            Row(
                              children: [
                                const SvgIcon(
                                  icon: AppIcons.laundry,
                                ),
                                // const Wspacing(width: 5),
                                Text(
                                  'LAUNDRY',
                                  style: AppTextStyles.labelSmaller,
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              const Hspacing(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products',
                    style: AppTextStyles.titleSmall,
                  ),
                  Text(
                    'See all',
                    style: AppTextStyles.bodySmaller.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Hspacing(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DashBoardModel {
  final String title;
  final String image;
  final Color textColor;
  final Color bgColor;
  DashBoardModel({
    required this.title,
    required this.image,
    required this.textColor,
    required this.bgColor,
  });
}
