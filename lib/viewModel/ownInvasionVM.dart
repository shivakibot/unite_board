import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/viewModel/homeVM.dart';
import '../model/team.dart';

final ownInvasionProvider = StateNotifierProvider<OwnInvasionProvider, Map<Position, bool>>(
        (ref) {
      final invasion = ref.watch(homeProvider).own.invasion;
      return OwnInvasionProvider(invasion);
    });


class OwnInvasionProvider extends StateNotifier<Map<Position, bool>>{
  final Map<Position, bool> _invasion;
  OwnInvasionProvider(this._invasion):super(initialOwnGoalValue){
    state = _invasion;
  }
}