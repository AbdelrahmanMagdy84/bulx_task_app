import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/savings/cubit/savings_cubit.dart';


class SavingsMoneyWidget extends StatelessWidget {
  const SavingsMoneyWidget({Key? key}) : super(key: key);
  TextStyle moneyTextStyle([double textSize = 20]) => TextStyle(
      color: const Color(0xff101112),
      fontWeight: FontWeight.bold,
      fontFamily: "SFProDisplay",
      fontSize: textSize);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 4.h,
      width: 40.w,
      child: LayoutBuilder(
        builder: (context, constraint) {
          final maxWidth = constraint.maxWidth / 100;

          return Row(
            children: [
              Image.asset(
                "assets/images/savingsIcon.png",
                width: maxWidth * 15,
              ),
              SizedBox(
                width: maxWidth * 2,
              ),
              BlocBuilder<SavingsCubit, SavingsState>(
                  builder: (context, state) {
                double savings = SavingsCubit.get(context).getSavingsAmount();
                return SizedBox(
                  width: maxWidth * 83,
                  child: Row(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                            Text("EGP ", style: moneyTextStyle(maxWidth * 13)),
                      ),
                      SizedBox(
                        width: maxWidth * 52,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: McCountingText(
                            begin: state is SavingsPlaying ? 0 : savings,
                            precision: 2,
                            end: savings,
                            //textScaleFactor: 1,
                            style: moneyTextStyle(savings >= 999999
                                ? maxWidth * 10
                                : maxWidth * 13),
                            maxLines: 1,
                            duration: const Duration(seconds: 2),
                            curve: Curves.linear,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
