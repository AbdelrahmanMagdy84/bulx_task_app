import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'savings_state.dart';

class SavingsContentCubit extends Cubit<SavingsStatetState> {
  SavingsContentCubit() : super(SavingsInitial());
  final moneyCountAnimationDuration = const Duration(seconds: 2);

  final ConfettiController _controllerBottomCenter =
      ConfettiController(duration: const Duration(seconds: 1));

  final double _savings = 2020.20;

  double getSavingsAmount() => _savings;

  static SavingsContentCubit get(BuildContext context) =>
      BlocProvider.of<SavingsContentCubit>(context);

  ConfettiController getConfettiController() {
    return _controllerBottomCenter;
  }

  void play() {
    if (state is SavingsInitial) {
      Future.delayed(moneyCountAnimationDuration, () {
        if (state is SavingsInitial) {
          _controllerBottomCenter.play();
          emit(SavingsCompleted());
        }
      });
    }
  }

  @override
  void onChange(Change<SavingsStatetState> change) {
    // TODO: implement onChange
    print(state);
    super.onChange(change);
  }
}
