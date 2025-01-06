import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitObserver extends BlocObserver {
  @override
  void onCreate(BlocBase cubit) {
    super.onCreate(cubit);
    // Called when a Cubit is created
    print('Cubit created: ${cubit.runtimeType}');
  }

  @override
  void onChange(BlocBase cubit, Change change) {
    super.onChange(cubit, change);
    // Called when a Cubit changes state
    print('Cubit: ${cubit.runtimeType}, Change: $change');
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    super.onError(cubit, error, stackTrace);
    // Called when an error occurs within a Cubit
    print('Cubit: ${cubit.runtimeType}, Error: $error');
  }

  @override
  void onClose(BlocBase cubit) {
    super.onClose(cubit);
    // Called when a Cubit is closed
    print('Cubit closed: ${cubit.runtimeType}');
  }
}
