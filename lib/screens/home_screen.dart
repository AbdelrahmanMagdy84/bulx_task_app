import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/savings/savings_card.dart';
import '../widgets/shared/best_image_size.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 13.w,
          child: selectImageBasedOnDeviceSize("logo"),
        ),
      ),
      body: SavingsCard(),
    ));
  }
}
