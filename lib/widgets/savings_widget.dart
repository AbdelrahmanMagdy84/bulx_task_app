import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'dart:math';

class SavingsWidget extends StatefulWidget {
  const SavingsWidget({Key? key}) : super(key: key);

  @override
  State<SavingsWidget> createState() => _SavingsWidgetState();
}

class _SavingsWidgetState extends State<SavingsWidget> {
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    size = Size(12, 12);
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
    var children2 = [
      Positioned(
        top: 0,
        child: Image.asset(
          "assets/images/arrow.png",
        ),
      ),
      Positioned(
        top: 0,
        right: 0,
        child: Image.asset(
          "assets/images/star.png",
        ),
      ),
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
              Container(
                child: Image.asset(
                  "assets/images/heart.png",
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 10,
        child: Container(
          height: 20.h,
          width: 30.w,
          alignment: Alignment.bottomCenter,
          child: ConfettiWidget(
            canvas: Size.fromRadius(20.h),
            confettiController: _controllerBottomCenter,
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
        ),
      ),
    ];
    return Column(
      children: [
        Container(
          height: 13.h,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color(0xffebf9fb),
          ),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              ...children2,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Your Total Savings",
                          style: TextStyle(
                              color: Color(0xff75808a),
                              fontWeight: FontWeight.w600,
                              fontFamily: "SFProText",
                              fontSize: 12.0),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/savingsIcon.png",
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const FittedBox(
                              child: Text("EGP 512.00",
                                  style: TextStyle(
                                      color: Color(0xff101112),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "SFProDisplay",
                                      fontSize: 20.0),
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Tell a friend",
                        style: TextStyle(
                            fontFamily: "SFProText-Semibold",
                            color: Colors.black),
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              _controllerBottomCenter.play();
            },
            child: Text("play"))
      ],
    );
  }
}
