import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/model/character.dart';
import 'package:unite_board/viewModel/homeVM.dart';

import '../model/team.dart';

final ownCharacterPosProvider = StateNotifierProvider<OwnCharacterPosProvider, Map<Character, Position>>((ref) {
  final characterPos = ref.watch(homeProvider).own.characterPos;
  return OwnCharacterPosProvider(characterPos);
});

class OwnCharacterPosProvider extends StateNotifier<Map<Character, Position>>{
  final Map<Character, Position> _characterPos;
  OwnCharacterPosProvider(this._characterPos):super({}){
    state = _characterPos;
  }
}