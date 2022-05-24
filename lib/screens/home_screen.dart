import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../bloc/savings/cubit/savings_cubit.dart';
import '../helpers/orientation_function.dart';
import '../widgets/savings/savings_card.dart';
import '../widgets/shared/best_image_size.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController(
        initialScrollOffset: isPortrait(context) ? 13.h : 25.w);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            width: 13.w,
            child: selectImageBasedOnDeviceSize("logo"),
          ),
        ),
        body: NestedScrollView(
            controller: scrollController,
            headerSliverBuilder: (context, boool) {
              return [
                SliverAppBar(
                  pinned: false,
                  toolbarHeight: isPortrait(context) ? 13.h : 25.w,
                  snap: false,
                  floating: true,
                  title: VisibilityDetector(
                    key: const Key('my-widget-key'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      if (visiblePercentage <= 5) {
                        SavingsCubit.get(context).ready();
                      } else if (visiblePercentage == 100) {
                        SavingsCubit.get(context).play();
                      }
                    },
                    child: SavingsCard(),
                  ),
                )
              ];
            },
            dragStartBehavior: DragStartBehavior.down,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      color: Colors.white, height: 2000, width: double.infinity)
                ],
              ),
            )),
      ),
    );
  }
}
