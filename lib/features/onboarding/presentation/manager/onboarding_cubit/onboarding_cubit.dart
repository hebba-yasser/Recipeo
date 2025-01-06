import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  final PageController boardController = PageController();
  int currentPage = 0;
  void nextPage(int totalPages) {
    if (currentPage < totalPages - 1) {
      boardController.nextPage(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      setPage(currentPage + 1);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      boardController.previousPage(
        duration: const Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      setPage(currentPage - 1);
    }
  }

  void setPage(int pageIndex) {
    currentPage = pageIndex;
    emit(OnboardingSetPage(pageindex: pageIndex));
  }
}
