import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedBoolProvider = StateNotifierProvider<SelectedBoolProvider, bool>(
        (ref) {
      return SelectedBoolProvider();
    });


class SelectedBoolProvider extends StateNotifier<bool>{
  SelectedBoolProvider():super(false);
  void selected(){
    state = !state;
  }
}