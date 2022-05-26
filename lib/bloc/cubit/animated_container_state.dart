part of 'animated_container_cubit.dart';

@immutable
abstract class AnimatedContainerState {
  abstract bool isAnimated;
}

class AnimatedContainerInitial extends AnimatedContainerState {
  @override
  bool isAnimated = false;
}

class AnimatedContainerFinished extends AnimatedContainerState {
  @override
  bool isAnimated;
  AnimatedContainerFinished(this.isAnimated);
}
