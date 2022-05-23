import 'package:bloc/bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  SavingsCubit() : super(SavingsInitial());

  final ConfettiController _controllerBottomCenter =
      ConfettiController(duration: const Duration(seconds: 1));

  double _savings = 20000.20;

  double getSavingsAmount() => _savings;

  static SavingsCubit get(BuildContext context) =>
      BlocProvider.of<SavingsCubit>(context);

  ConfettiController getConfettiController() {
    return _controllerBottomCenter;
  }

  void play() {
    emit(SavingsPlaying());

    Future.delayed(const Duration(seconds: 1), () {
      _controllerBottomCenter.play();
      emit(SavingsIdeal());
    });
  }

  void stop() {
    _controllerBottomCenter.stop();
    emit(SavingsIdeal());
  }
}
