import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/orientation_function.dart';
import '../shared/best_image_size.dart';
import 'confetti_widget.dart';
import 'savings_money_widget.dart';

class SavingsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isPortrait(context) ? 13.h : 25.w,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xffebf9fb),
      ),
      child: savingsStackBuilder(context),
    );
  }

  List<Widget> stackDecoration() {
    return [
      Positioned(top: 0, child: selectImageBasedOnDeviceSize("arrow")),
      Positioned(top: 0, right: 0, child: selectImageBasedOnDeviceSize("star")),
      Positioned(
        bottom: 0,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              Container(
                width: 80,
                alignment: Alignment.bottomRight,
              ),
              selectImageBasedOnDeviceSize("heart")
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        child: CustomConfettiWidget(),
      ),
    ];
  }

  Stack savingsStackBuilder(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        ...stackDecoration(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: isPortrait(context) ? 30.w : 30.h,
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Your Total Savings",
                        style: TextStyle(
                          color: const Color(0xff75808a),
                          fontWeight: FontWeight.w600,
                          fontFamily: "SFProText",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SavingsMoneyWidget(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 28.w,
              child: FittedBox(
                child: savingsButtonWidgetBuilder(),
              ),
            )
          ],
        ),
      ],
    );
  }

  ElevatedButton savingsButtonWidgetBuilder() {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        "Tell a friend",
        style: TextStyle(fontFamily: "SFProText-Semibold", color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
