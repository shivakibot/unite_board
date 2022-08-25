import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/model/character.dart';
import 'package:unite_board/model/situation.dart';

import '../model/team.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, Situation>((ref) => HomeNotifier());

class HomeNotifier extends StateNotifier<Situation>{

  HomeNotifier() : super(Situation(
    own: Team(invasion: initialOwnGoalValue),
    opposition: Team(invasion: initialOppositionGoalValue),
  ));

  void majored(Size? size){
    if(size != null){
      state = state.copyWith(size: size);
    }
  }
  void chooseOwnMember(Character character){
    var tmp = [...state.own.characters];
    if(tmp.length < 5){
      tmp.add(character);
    } else {
      return;
    }
    var updated = state.own.copyWith(characters: tmp.toSet());
    state = state.copyWith(own: updated);
  }
  void chooseOppositionMember(Character character){
    var tmp = [...state.opposition.characters];
    if(tmp.length < 5){
      tmp.add(character);
    } else {
      return;
    }
    var updated = state.opposition.copyWith(characters: tmp.toSet());
    state = state.copyWith(opposition: updated);
  }

  void removeOwnMember(Character character){
    resetOwnCharacterPosition(character);
    var tmp = {...state.own.characters};
    tmp.remove(character);
    var updated = state.own.copyWith(characters: tmp);
    state = state.copyWith(own: updated);
  }

  void removeOppositionMember(Character character){
    resetOppositionCharacterPosition(character);
    var tmp = {...state.opposition.characters};
    tmp.remove(character);
    var updated = state.opposition.copyWith(characters: tmp);
    state = state.copyWith(opposition: updated);
  }

  void pass(int value){
    state = state.copyWith(time: Announce.values[value]);
  }

  void switchOwnGoal(Position position){
    var tmp = {...state.own.invasion};
    tmp.update(position, (value) => !value);
    var updated = state.own.copyWith(invasion: tmp);
    state = state.copyWith(own: updated);
  }

  void switchOppositionGoal(Position position){
    var tmp = {...state.opposition.invasion};
    tmp.update(position, (value) => !value);
    var updated = state.opposition.copyWith(invasion: tmp);
    state = state.copyWith(opposition: updated);
  }

  void setPosition(Map<Character, bool> data, Position position){
    var pos = data.entries.first;
    if(pos.value == true){
      /// own data
      var tmp = {...state.own.characterPos};
      tmp[pos.key] = position;
      var updated = state.own.copyWith(characterPos: tmp);
      state = state.copyWith(own: updated);
    }else{
      /// opposition data
      var tmp = {...state.opposition.characterPos};
      tmp[pos.key] = position;
      var updated = state.opposition.copyWith(characterPos: tmp);
      state = state.copyWith(opposition: updated);
    }
  }

  void resetOwnCharacterPosition(Character character){
    var tmp = {...state.own.characterPos};
    tmp.remove(character);
    var updated = state.own.copyWith(characterPos: tmp);
    state = state.copyWith(own: updated);
  }

  void resetOppositionCharacterPosition(Character character){
    var tmp = {...state.opposition.characterPos};
    tmp.remove(character);
    var updated = state.opposition.copyWith(characterPos: tmp);
    state = state.copyWith(opposition: updated);
  }
}