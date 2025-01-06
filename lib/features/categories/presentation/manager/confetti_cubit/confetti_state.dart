part of 'confetti_cubit.dart';

@immutable
sealed class ConfettiState {}

final class ConfettiInitial extends ConfettiState {}

final class ConfettiPlaying extends ConfettiState {}

final class ConfettiStopped extends ConfettiState {}
