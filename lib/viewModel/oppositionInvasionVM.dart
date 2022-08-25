import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/viewModel/homeVM.dart';
import '../model/team.dart';

final oppositionInvasionProvider = StateNotifierProvider<OppositionInvasionProvider, Map<Position, bool>>(
        (ref) {
      final invasion = ref.watch(homeProvider).opposition.invasion;
      return OppositionInvasionProvider(invasion);
    });


class OppositionInvasionProvider extends StateNotifier<Map<Position, bool>>{
  final Map<Position, bool> _invasion;
  OppositionInvasionProvider(this._invasion):super(initialOppositionGoalValue){
    state = _invasion;
  }
}