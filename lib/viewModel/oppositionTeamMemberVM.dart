import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/model/character.dart';
import 'package:unite_board/viewModel/homeVM.dart';

final oppositionTeamMemberProvider = StateNotifierProvider<OppositionTeamMemberProvider, Set<Character>>((ref) {
  final set = ref.watch(homeProvider).opposition.characters;
  return OppositionTeamMemberProvider(set);
});

class OppositionTeamMemberProvider extends StateNotifier<Set<Character>>{
  final Set<Character> set;
  OppositionTeamMemberProvider(this.set):super({}){
    state = set;
  }
}