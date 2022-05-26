import 'package:bulx_task_app/widgets/savings/savings_card.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  SavingsCubit() : super(SavingsInitial());
  final moneyCountAnimationDuration = const Duration(seconds: 2);

  final ConfettiController _controllerBottomCenter =
      ConfettiController(duration: const Duration(seconds: 1));

  final double _savings = 2020.20;

  double getSavingsAmount() => _savings;

  static SavingsCubit get(BuildContext context) =>
      BlocProvider.of<SavingsCubit>(context);

  ConfettiController getConfettiController() {
    return _controllerBottomCenter;
  }

  void play() {
    if (state is SavingsInitial) {
      Future.delayed(moneyCountAnimationDuration, () {
        _controllerBottomCenter.play();
        emit(SavingsIdeal());
      });
    }
  }

  @override
  void onChange(Change<SavingsState> change) {
    // TODO: implement onChange
    print(state);
    super.onChange(change);
  }
}
