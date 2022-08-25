import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/viewModel/homeVM.dart';
import '../model/character.dart';
import '../viewModel/sizeVM.dart';


class CharacterView extends StatelessWidget{
  final Character character;
  const CharacterView({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(2),
      width: 60,
      height: 60,
      decoration: const ShapeDecoration(
        shape: StadiumBorder(
          side: BorderSide(
              width: 2.0,
              color: Colors.black12,
          ),
        ),
      ),
      duration: const Duration(seconds: 1),
      child: Image.asset(
        character.path,
      ),
    );
  }

}

class MiniCharacterView extends StatelessWidget{
  final Character character;
  final bool own;
  const MiniCharacterView({Key? key, required this.character, required this.own}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
            color: own ?
            const Color.fromRGBO(42, 105, 140, 1.0).withOpacity(0.5):
            const Color.fromRGBO(244, 132, 54, 1.0).withOpacity(0.5),
            width: 2
        ),
      ),
      duration: const Duration(seconds: 1),
      child: Image.asset(
        character.path,
      ),
    );
  }
}

class CardCharacterView extends StatelessWidget{
  final Character character;
  const CardCharacterView({Key? key, required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height/7,
      child: ListTile(
        dense: true,
        title: Image.asset(
          character.path,
        ),
      ),
    );
  }
}

class _FeedBackCharacterView extends ConsumerWidget{
  final Character character;
  const _FeedBackCharacterView({Key? key, required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(backGroundSizeProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height/7,
      width: size != null ? (MediaQuery.of(context).size.width - size.width.toDouble())/2 : 100,
      child: Image.asset(
        character.path,
      ),
    );
  }
}

class RemovableCharacterView extends ConsumerWidget{
  final bool own;
  final Character character;
  const RemovableCharacterView({Key? key,required this.own ,required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: InkWell(
          onTap: () => own ?
          ref.read(homeProvider.notifier).removeOwnMember(character) :
          ref.read(homeProvider.notifier).removeOppositionMember(character),
          child: CardCharacterView(character: character,),
        ),
      ),
    );
  }
}

class RepositionableCharacterView extends ConsumerWidget{
  final bool own;
  final Character character;
  const RepositionableCharacterView({Key? key,required this.own ,required this.character}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: InkWell(
          onTap: () => own ?
          ref.read(homeProvider.notifier).resetOwnCharacterPosition(character) :
          ref.read(homeProvider.notifier).resetOppositionCharacterPosition(character),
          child: Draggable(
            feedback: _FeedBackCharacterView(character: character,),
            childWhenDragging: Opacity(
              opacity: 0.5,
              child: _FeedBackCharacterView(character: character,),
            ),
            data: {character:own},
            child: CardCharacterView(character: character,),
          ),
        ),
      ),
    );
  }
}