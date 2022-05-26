import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'animated_container_state.dart';

class AnimatedContainerCubit extends Cubit<AnimatedContainerState> {
  AnimatedContainerCubit() : super(AnimatedContainerInitial());
  bool _isAnimatedCardHeight = false;
  bool get isAnimatedCardHeight {
    return _isAnimatedCardHeight;
  }
  static AnimatedContainerCubit get(BuildContext context) =>
      BlocProvider.of<AnimatedContainerCubit>(context);

  void playSavingsCardAnimation() {
    _isAnimatedCardHeight = true;
    emit(AnimatedContainerFinished(_isAnimatedCardHeight));
  }
}
