import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/model/character.dart';
import 'package:unite_board/viewModel/homeVM.dart';

final ownTeamMemberProvider = StateNotifierProvider<OwnTeamMemberProvider, Set<Character>>((ref) {
  final set = ref.watch(homeProvider).own.characters;
  return OwnTeamMemberProvider(set);
});

class OwnTeamMemberProvider extends StateNotifier<Set<Character>>{
  final Set<Character> _set;
  OwnTeamMemberProvider(this._set):super({}){
    state = _set;
  }
}