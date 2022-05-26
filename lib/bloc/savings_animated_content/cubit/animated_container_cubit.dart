import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../helpers/orientation_function.dart';
part 'animated_container_state.dart';

class SavingsAnimatedCardCubit extends Cubit<SavingsAnimatedCardState> {
  SavingsAnimatedCardCubit() : super(SavingsAnimatedCardStateInitial());
  bool _isAnimatedCardHeight = false;
  bool get isAnimatedCardHeight {
    return _isAnimatedCardHeight;
  }

  static SavingsAnimatedCardCubit get(BuildContext context) =>
      BlocProvider.of<SavingsAnimatedCardCubit>(context);
  Duration animateionDuration = const Duration(seconds: 1);
  
  void play() {
    _isAnimatedCardHeight = true;
    emit(SavingsAnimatedCardPlayingState(_isAnimatedCardHeight));
  }

  @override
  void onChange(Change<SavingsAnimatedCardState> change) {
    // TODO: implement onChange
    print(state);
    super.onChange(change);
  }

 

  double getAnimationValue(
    AnimateType type,
    BuildContext context,
  ) {
    if (type == AnimateType.cardSize) {
      return state is SavingsAnimatedCardPlayingState?
          ? (isPortrait(context) ? 13.h : 25.w)
          : state is SavingsAnimatedCardFinishedState
              ? (isPortrait(context) ? 13.h : 25.w)
              : 0;
    } else if (type == AnimateType.contentOpacity) {
      return state is SavingsAnimatedCardPlayingState?
          ? 1
          : state is SavingsAnimatedCardFinishedState
              ? 1
              : 0;
    }
    return 0;
  }
}

enum AnimateType {
  // ignore: constant_identifier_names
  cardSize,
  contentOpacity
}
