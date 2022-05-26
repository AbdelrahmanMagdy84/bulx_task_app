part of 'animated_container_cubit.dart';

@immutable
abstract class SavingsAnimatedCardState {
  abstract bool isAnimated;
}

class SavingsAnimatedCardStateInitial extends SavingsAnimatedCardState {
  @override
  bool isAnimated = false;
}

class SavingsAnimatedCardFinishedState extends SavingsAnimatedCardState {
  @override
  bool isAnimated;
  SavingsAnimatedCardFinishedState(this.isAnimated);
}

class SavingsAnimatedCardPlayingState extends SavingsAnimatedCardState {
  @override
  bool isAnimated;
  SavingsAnimatedCardPlayingState(this.isAnimated);
}
