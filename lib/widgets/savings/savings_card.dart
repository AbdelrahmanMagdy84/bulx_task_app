import 'package:bulx_task_app/widgets/savings/savings_stack.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../helpers/orientation_function.dart';

class SavingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isPortrait(context) ? 13.h : 25.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xffebf9fb),
      ),
      child: const SavingsStackWidget(),
    );
  }
}
