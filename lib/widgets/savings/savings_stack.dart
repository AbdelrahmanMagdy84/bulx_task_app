import 'package:bulx_task_app/widgets/savings/savings_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../helpers/orientation_function.dart';
import '../shared/best_image_size.dart';
import 'confetti_widget.dart';
import 'savings_money_widget.dart';

class SavingsStackWidget extends StatelessWidget {
  const SavingsStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          color: Color(0xff75808a),
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
              margin: EdgeInsets.only(right: isPortrait(context) ? 20 : 30),
              width: isPortrait(context) ? 30.w : 20.h,
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: SavingsButton(),
              ),
            )
          ],
        ),
      ],
    );
  }
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
