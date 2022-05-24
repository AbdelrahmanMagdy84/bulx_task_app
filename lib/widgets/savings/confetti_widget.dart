import 'dart:math';
import 'package:bulx_task_app/helpers/shaps_path_builder.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/savings/cubit/savings_cubit.dart';

class CustomConfettiWidget extends StatelessWidget {
  final List<MaterialColor> colors = const [
    Colors.yellow,
    Colors.red,
    Colors.orange,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.orange,
    Colors.purple
  ];
  double degToRad(double deg) => deg * (pi / 180.0);

  Path drawStar(Size size) {
    final path = Path();
    starPathBuilder(path, degToRad);
    path.close();
    return path;
  }

  Path drawShap1(Size size) {
    final path0 = Path();
    pathBuilder(path0);
    return path0;
  }

  @override
  Widget build(BuildContext context) {
    double height;
    double width;
    if (SizerUtil.orientation == Orientation.landscape) {
      height = 50.w;
      width = 30.h;
    } else {
      height = 20.h;
      width = 30.w;
    }
    return Container(
      height: height,
      width: width,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          confettiBuilder(context, drawStar),
          confettiBuilder(context, drawShap1)
        ],
      ),
    );
  }

  ConfettiWidget confettiBuilder(
      BuildContext context, Path Function(Size) draw) {
    return ConfettiWidget(
      confettiController: SavingsCubit.get(context).getConfettiController(),
      blastDirection: degToRad(270),
      particleDrag: .1,
      emissionFrequency: 0.05,
      numberOfParticles: 20,
      minBlastForce: 0.1,
      maxBlastForce: 3,
      gravity: 0.09,
      colors: colors,
      strokeWidth: 0.00,
      strokeColor: Colors.white,
      createParticlePath: draw,
    );
  }
}
