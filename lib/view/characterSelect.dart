import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/viewModel/ownTeamMemberVM.dart';

import '../model/character.dart';
import '../viewModel/homeVM.dart';
import '../viewModel/oppositionTeamMemberVM.dart';
import 'character.dart';
import 'home.dart';

class CharacterSelect extends ConsumerWidget{
  CharacterSelect({Key? key}) : super(key: key);
  final List<int> index = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: _OwnTeam()
          ),
          Expanded(
              flex: 6,
              child: _DraggableCharacter()
          ),
          Expanded(
              flex: 1,
              child: _OppositionTeam()
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
      ),
    );
  }
}

class _OwnTeam extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownTeam = ref.watch(ownTeamMemberProvider);
    return DragTarget(
      onAccept: (Character data) {
        ref.read(homeProvider.notifier).chooseOwnMember(data);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          color: const Color.fromRGBO(111, 47, 219, 1.0),
          child: ListView(
            children: [
              for(final member in ownTeam)
                RemovableCharacterView(character: member, own: true),
            ],
          ),
        );
      },
    );
  }

}

class _OppositionTeam extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final oppositionTeam = ref.watch(oppositionTeamMemberProvider);
    return DragTarget(
      onAccept: (Character data) {
        ref.read(homeProvider.notifier).chooseOppositionMember(data);
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          color: const Color.fromRGBO(244, 132, 54, 1.0),
          child: ListView(
            children: [
              for(final member in oppositionTeam)
                RemovableCharacterView(character: member, own: false),
            ],
          ),
        );
      },
    );
  }
}

class _DraggableCharacter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
        ),
        children: [
          for(final character in Character.values)
            Draggable(
                data: character,
                feedback: CharacterView(character: character,),
                childWhenDragging: Opacity(
                  opacity: 0.5,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: CharacterView(character: character,),
                  ),
                ),
                child: CharacterView(character: character,)
            ),
        ],
      ),
    );
  }

}