import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../bloc/savings/cubit/savings_cubit.dart';
import '../widgets/savings_widgets/savings_card.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              VisibilityDetector(
                key: const Key('my-widget-key'),
                onVisibilityChanged: (visibilityInfo) {
                  var visiblePercentage = visibilityInfo.visibleFraction * 100;
                  if (visiblePercentage == 100) {
                    SavingsCubit.get(context).play();
                  } else {
                    SavingsCubit.get(context).stop();
                  }
                },
                child: SavingsCard(),
              ),
              Container(
                  color: Colors.black, height: 2000, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
