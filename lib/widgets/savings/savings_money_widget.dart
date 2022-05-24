import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/savings/cubit/savings_cubit.dart';
import '../../helpers/orientation_function.dart';
import '../shared/best_image_size.dart';

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
      height: isPortrait(context) ? 4.h : 10.w,
      width: isPortrait(context) ? 40.w : 40.h,
      child: LayoutBuilder(
        builder: (context, constraint) {
          final maxWidth = constraint.maxWidth / 100;
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: selectImageBasedOnDeviceSize(
                      "savingsIcon", maxWidth * 15),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 4,
                child: BlocBuilder<SavingsCubit, SavingsState>(
                    builder: (context, state) {
                  double savings = SavingsCubit.get(context).getSavingsAmount();
                  return SizedBox(
                    width: maxWidth * 83,
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: FittedBox(
                            child: Text("EGP ",
                                style: moneyTextStyle(maxWidth * 13)),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          fit: FlexFit.loose,
                          child: SizedBox(
                            width: maxWidth * 50,
                            child: FittedBox(
                              child: McCountingText(
                                begin: state is SavingsPlaying ? 0 : savings,
                                precision: 2,
                                end: savings,
                                style: moneyTextStyle(savings >= 999999
                                    ? maxWidth * 10
                                    : maxWidth * 13),
                                maxLines: 1,
                                duration: const Duration(seconds: 2),
                                curve: Curves.linear,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}
