import 'package:bulx_task_app/widgets/savings/savings_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: isPortrait(context) ? 8.h : 15.w,
                width: isPortrait(context) ? 50.w : 35.h,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 1,
                          child: yourTotalSavingsTextBuiler(constraints)),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            child: const SavingsMoneyWidget()),
                      ),
                    ],
                  );
                }),
              ),
            ),
            SizedBox(
              height: isPortrait(context) ? 8.h : 14.w,
              width: isPortrait(context) ? 35.w : 35.h,
              child: Container(
                margin: EdgeInsets.only(right: isPortrait(context) ? 20 : 30),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: SavingsButton(),
                        ),
                      )
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ],
    );
  }

  SizedBox yourTotalSavingsTextBuiler(BoxConstraints constraints) {
    return SizedBox(
      height: constraints.maxHeight,
      width: constraints.maxWidth * 0.7,
      child: const FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          "Your Total Savings",
          style: TextStyle(
            color: Color(0xff75808a),
            fontWeight: FontWeight.w600,
            fontFamily: "SFProText",
          ),
        ),
      ),
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
