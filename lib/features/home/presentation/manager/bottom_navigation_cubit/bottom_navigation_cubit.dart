import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:recpie_app/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../Library/presentation/views/library_view_body.dart';
import '../../../../Search/presetation/views/widgets/search_view_body.dart';
import '../../../../categories/presentation/views/categories_view_body.dart';
import '../../../../profile/presentation/views/profile_view_body.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationInitial());
  int currentIndex = 0;
  List<Widget> bottomNavScreens = [
    const HomeViewBody(),
    const SearchViewBody(),
    const LibraryViewBody(),
    const CategoriesViewBody(),
    const ProfileViewBody(),
  ];
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
