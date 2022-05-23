import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../bloc/savings/cubit/savings_cubit.dart';


class CustomConfettiWidget extends StatelessWidget {
  
  
  Path drawStar(Size size) {
    size = const Size(12, 12);
    double degToRad(double deg) => deg * (pi / 180.0);
    const numberOfPoints = 10;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
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
      child: ConfettiWidget(
        canvas: Size.fromRadius(height),
        confettiController: SavingsCubit.get(context).getConfettiController(),
        blastDirectionality: BlastDirectionality.explosive,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
        createParticlePath: drawStar,
        emissionFrequency: 0.02,
        maxBlastForce: 10,
        minBlastForce: 7,
        numberOfParticles: 50,
        gravity: 0.05,
      ),
    );
  }
}
