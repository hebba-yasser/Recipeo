import 'package:bloc/bloc.dart';
import 'package:confetti/confetti.dart';
import 'package:meta/meta.dart';

part 'confetti_state.dart';

class ConfettiCubit extends Cubit<ConfettiState> {
  ConfettiCubit() : super(ConfettiInitial());
  final ConfettiController confettiController =
      ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController confettiController2 =
      ConfettiController(duration: const Duration(seconds: 1));
  final ConfettiController confettiController3 =
      ConfettiController(duration: const Duration(seconds: 1));
  void playConfetti() {
    confettiController.play();
    confettiController2.play();
    confettiController3.play();
    emit(ConfettiPlaying());
    Future.delayed(const Duration(seconds: 1), () {
      stopConfetti();
    });
  }

  void stopConfetti() {
    confettiController.stop();
    confettiController2.stop();
    confettiController3.stop();
    emit(ConfettiStopped());
  }

  @override
  Future<void> close() {
    confettiController.dispose();
    confettiController2.dispose();
    confettiController3.dispose();
    return super.close();
  }
}
