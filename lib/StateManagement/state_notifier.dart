import 'package:riverpod/riverpod.dart';

class NumbersNotifier extends StateNotifier<List<int>> {
  NumbersNotifier () : super([]);

  void add(int number) {
    state = [...state, number];
  }

  void delete() {
    state = [
      // for(final loopNumber in state) {
      //   if(number != loopNumber) loopNumber;
      // }
    ];
  }
}
