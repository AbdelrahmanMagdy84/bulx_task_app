import 'package:bulx_task_app/bloc/savings/cubit/savings_cubit.dart';
import 'package:bulx_task_app/widgets/savings/savings_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../bloc/cubit/animated_container_cubit.dart';
import '../../helpers/orientation_function.dart';

class SavingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds:2),
        () => AnimatedContainerCubit.get(context).playSavingsCardAnimation());

    return BlocConsumer<AnimatedContainerCubit, AnimatedContainerState>(
      listener: (context, state) {
        if (state.isAnimated) SavingsCubit.get(context).play();
      },
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: state.isAnimated ? (isPortrait(context) ? 13.h : 25.w) : 0,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color(0xffebf9fb),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const SavingsStackWidget(),
        );
      },
    );
  }
}
// AnimatedContainer(
//           duration: const Duration(seconds: 1),
//           height: state.isAnimated ? (isPortrait(context) ? 13.h : 25.w) : 0,
         
         
        
//           child:  ,
//         )