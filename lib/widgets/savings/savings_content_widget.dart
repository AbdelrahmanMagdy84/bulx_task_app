import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/orientation_function.dart';
import 'savings_button.dart';
import 'savings_money_widget.dart';

class SavingsContentWidget extends StatelessWidget {
  
  const SavingsContentWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    return Container(
        child: Row(
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
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: SavingsButton(),
                ),
              ),
            )
          ],
        ),
      );
  }
}