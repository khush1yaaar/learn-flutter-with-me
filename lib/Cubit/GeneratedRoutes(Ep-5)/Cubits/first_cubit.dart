import 'package:flutter_bloc/flutter_bloc.dart';

class FirstCubit extends Cubit<int> {
  FirstCubit() : super(0);
  void incrememt() => emit(state + 1);
}
