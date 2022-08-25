import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/model/character.dart';
import 'package:unite_board/viewModel/homeVM.dart';

import '../model/team.dart';

final oppositionCharacterPosProvider = StateNotifierProvider<OppositionCharacterPosProvider, Map<Character, Position>>((ref) {
  final characterPos = ref.watch(homeProvider).opposition.characterPos;
  return OppositionCharacterPosProvider(characterPos);
});

class OppositionCharacterPosProvider extends StateNotifier<Map<Character, Position>>{
  final Map<Character, Position> _characterPos;
  OppositionCharacterPosProvider(this._characterPos):super({}){
    state = _characterPos;
  }
}