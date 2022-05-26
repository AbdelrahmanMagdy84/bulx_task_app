import 'package:bulx_task_app/bloc/savings_animated_content/cubit/animated_container_cubit.dart';
import 'package:bulx_task_app/widgets/savings/savings_content_widget.dart';
import 'package:bulx_task_app/widgets/savings/savings_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      SavingsAnimatedCardCubit.get(context).play();
      
    });

    return BlocBuilder<SavingsAnimatedCardCubit, SavingsAnimatedCardState>(
      builder: (context, state) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(
              begin: 0,
              end: SavingsAnimatedCardCubit.get(context)
                  .getAnimationValue(AnimateType.cardSize, context)),
          duration: SavingsAnimatedCardCubit.get(context).animateionDuration,
          child: const SavingsContentWidget(),
          builder: (BuildContext context, double height, row) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: height,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xffebf9fb),
              ),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ...stackDecoration(),
                  TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: SavingsAnimatedCardCubit.get(context)
                            .getAnimationValue(
                                AnimateType.contentOpacity, context),
                      ),
                      duration: const Duration(seconds: 1),
                      builder: (context, opacity, _) {
                        return Opacity(opacity: opacity, child: row!);
                      })
                ],
              ),
            );
          },
        );
      },
    );
  }
}
