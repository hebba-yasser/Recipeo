import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recpie_app/core/cubits/update_favourites_cubit/update_favourites_cubit.dart';
import 'package:recpie_app/core/repos/shared_repos_imp.dart';
import 'package:recpie_app/core/styles/colors.dart';
import 'package:recpie_app/features/Library/data/repos/library_repos_imp.dart';
import 'package:recpie_app/features/Library/presentation/manager/fetch_collections_cubit/fetch_collections_cubit.dart';
import 'package:recpie_app/features/home/data/repos/home_repo_imp.dart';
import 'package:recpie_app/features/home/presentation/manager/popular_recipes_cubit/popular_recipes_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'constants.dart';
import 'core/cubits/user_data_cubit/user_data_cubit.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/service_locator.dart';
import 'features/home/presentation/manager/easy_recipes_cubit/easy_recipes_cubit.dart';
import 'features/home/presentation/manager/fetch_personalized_recipes_cubit/fetch_personalized_recipes_cubit.dart';
import 'features/home/presentation/manager/healthy_recipes_cubit/healthy_recipes_cubit.dart';
import 'features/home/presentation/manager/highly_rated_recipes_cubit/highly_rated_recipes_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Supabase.initialize(
    url: 'https://supolrnrivwcdzzsguoq.supabase.co',
    anonKey: dotenv.env['Supabase_Key']!,
  );
  Bloc.observer = AppCubitObserver();
  await CacheHelper.init();
  uId = CacheHelper.getString(key: 'uid');
  isLogged = CacheHelper.getBoolean(key: 'islogged') ?? false;
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserDataCubit(
            getIt.get<SharedReposImp>(),
          )..fetchUserData(id: uId ?? ''),
        ),
        BlocProvider(
            create: (context) =>
                FetchPersonalizedRecipesCubit(getIt.get<HomeRepoImp>())
                  ..fetchPersonalizedRecipes(id: uId ?? '')),
        BlocProvider(
          create: (context) => UpdateFavouritesCubit(
            getIt.get<SharedReposImp>(),
          ),
        ),
        BlocProvider(
          create: (context) => PopularRecipesCubit(getIt.get<HomeRepoImp>())
            ..fetchPopularRecipes(),
        ),
        BlocProvider(
          create: (context) => HealthyRecipesCubit(getIt.get<HomeRepoImp>())
            ..fetchHealthyRecipes(),
        ),
        BlocProvider(
          create: (context) => HighlyRatedRecipesCubit(getIt.get<HomeRepoImp>())
            ..fetchHighlyRatedRecipes(),
        ),
        BlocProvider(
          create: (context) =>
              EasyRecipesCubit(getIt.get<HomeRepoImp>())..fetchEasyRecipes(),
        ),
        BlocProvider(
          create: (context) =>
              FetchCollectionsCubit(getIt.get<LibraryReposImp>())
                ..fetchCollections(id: uId ?? ''),
        ),
      ],
      child: MaterialApp(
        color: kprimaryColor,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(primary: AppColors.cream),
          applyElevationOverlayColor: true,
          unselectedWidgetColor: Colors.white,
          disabledColor: AppColors.cream,
          indicatorColor: AppColors.cream,
          hoverColor: AppColors.cream,
          shadowColor: AppColors.cream,
          focusColor: AppColors.cream,
          splashColor: AppColors.cream,
          dialogBackgroundColor: AppColors.cream,
          secondaryHeaderColor: AppColors.cream,
          canvasColor: AppColors.cream,
          highlightColor: AppColors.cream,
          cardColor: AppColors.cream,
          primaryColorLight: kprimaryColor,
          primaryTextTheme:
              GoogleFonts.giveYouGloryTextTheme(ThemeData.light().textTheme),
          primaryColor: kprimaryColor,
          // Orange
          scaffoldBackgroundColor: Colors.white,
          // Cream
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: kprimaryColor,
            foregroundColor: Colors.white,
          ),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: AppColors.lightPeach,
          )),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kprimaryColor,
              foregroundColor: AppColors.lightPeach,
            ),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
