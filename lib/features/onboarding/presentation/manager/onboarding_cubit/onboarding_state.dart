part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingSetPage extends OnboardingState {
  final int pageindex;

  OnboardingSetPage({required this.pageindex});
}
