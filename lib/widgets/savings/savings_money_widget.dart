import 'package:bulx_task_app/bloc/cubit/animated_container_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mccounting_text/mccounting_text.dart';
import '../../bloc/savings/cubit/savings_cubit.dart';
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

    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(right: 5),
            child: selectImageBasedOnDeviceSize(
              "savingsIcon",
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 4,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text("EGP ", style: moneyTextStyle()),
                ),
              ),
              BlocBuilder<AnimatedContainerCubit, AnimatedContainerState>(
                  builder: (context, state) {
                double savings = SavingsCubit.get(context).getSavingsAmount();
                return Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: SizedBox(
                    child: FittedBox(
                      child: McCountingText(
                        begin: state.isAnimated ? 0 : savings,
                        precision: 2,
                        end: savings,
                        style: moneyTextStyle(),
                        maxLines: 1,
                        duration: SavingsCubit.get(context)
                            .moneyCountAnimationDuration,
                        curve: Curves.linear,
                        key: Key("x"),
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
    
  }
}
