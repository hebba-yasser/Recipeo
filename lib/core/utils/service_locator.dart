import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recpie_app/core/repos/shared_repos_imp.dart';
import 'package:recpie_app/features/Library/data/repos/library_repos_imp.dart';
import 'package:recpie_app/features/Search/data/repos/search_repos_imp.dart';
import 'package:recpie_app/features/categories/data/repos/categories_repos_imp.dart';

import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/profile/data/repos/profile_repos_imp.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<SharedReposImp>(SharedReposImp(
    getIt.get<ApiService>(),
  ));
  getIt
      .registerSingleton<AuthRepoImp>(AuthRepoImp(getIt.get<SharedReposImp>()));

  getIt.registerSingleton<ProfileReposImp>(
      ProfileReposImp(getIt.get<AuthRepoImp>(), getIt.get<SharedReposImp>()));
  getIt.registerSingleton<HomeRepoImp>(
      HomeRepoImp(getIt.get<ApiService>(), getIt.get<SharedReposImp>()));

  getIt.registerSingleton<CategoryReposImp>(CategoryReposImp(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<SearchReposImp>(
      SearchReposImp(getIt.get<ApiService>(), getIt.get<SharedReposImp>()));
  getIt.registerSingleton<LibraryReposImp>(
    LibraryReposImp(getIt.get<SharedReposImp>()),
  );
}
