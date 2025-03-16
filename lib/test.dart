import 'package:ecowash/core/di/service_locator.dart';
import 'package:ecowash/core/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'features/app/data/remote/collection_service.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButtons.primary(
              onPressed: () async {
                final service = Di.getIt<CollectionService>();
                await service.getCollections();
              },
              title: 'Test',
            )
          ],
        ),
      ),
    );
  }
}
