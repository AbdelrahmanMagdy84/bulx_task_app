import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../bloc/savings/cubit/savings_cubit.dart';
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              VisibilityDetector(
                key: const Key('my-widget-key'),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage <= 5) {
                    SavingsCubit.get(context).ready();
                  } else if (visiblePercentage == 100) {
                    SavingsCubit.get(context).play();
                  }
                },
                child: SavingsCard(),
              ),
              Container(
                  color: Colors.white, height: 2000, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
