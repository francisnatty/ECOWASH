import 'package:ecowash/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/animations/transition_animations.dart';
import '../../../../../../core/widgets/wwidgets.dart';
import '../../../sm/collection/bloc/collection_bloc.dart';
import '../../laundry/screens/laundry.dart';

class CollectionListWidget extends StatelessWidget {
  const CollectionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionBloc, CollectionState>(
      builder: (context, state) {
        if (state is CollectionLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CollectionsLoaded) {
          final collections = state.collections.data;
          return SizedBox(
            height: 300,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                // childAspectRatio: 1.0,
              ),
              itemCount: collections.length,
              itemBuilder: (context, index) {
                final collection = collections[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      AppPageRoute(
                        page: const LaundryScreen(),
                        transitionType: TransitionType.slideFromBottom,
                      ),
                    );

                    //  goTo(context: context, newScreen: const LaundryScreen());
                  },
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: collection.backgroundColor.toColor(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: Image.asset(
                            AppImages.laundry,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Hspacing(height: 20),
                        Text(
                          collection.name,
                          style: AppTextStyles.labelMedium.copyWith(
                            color: AppColors.materialThemeBlack,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
