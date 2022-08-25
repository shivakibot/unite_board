import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/view/characterSelect.dart';
import 'package:unite_board/viewModel/homeVM.dart';
import 'package:unite_board/viewModel/oppositionCharacterPosVM.dart';
import 'package:unite_board/viewModel/ownCharacterPosVM.dart';
import 'package:unite_board/viewModel/ownTeamMemberVM.dart';
import 'package:unite_board/model/situation.dart';
import 'package:unite_board/viewModel/announceVM.dart';
import 'package:unite_board/viewModel/oppositionInvasionVM.dart';
import 'package:unite_board/viewModel/oppositionTeamMemberVM.dart';
import 'package:unite_board/viewModel/ownInvasionVM.dart';
import 'package:unite_board/viewModel/sizeVM.dart';
import 'package:unite_board/view/character.dart';
import 'package:unite_board/model/character.dart';
import 'package:unite_board/model/team.dart';

final GlobalKey _mapKey = GlobalKey();

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(25.0),
            child: AppBar(
              title: _TimeDisplay(),
              centerTitle: true,
              flexibleSpace: _TimeSlider(),
              backgroundColor: Colors.transparent,
            ),
          ),
          backgroundColor: const Color.fromRGBO(42, 105, 140, 1.0),
          body: _StackBody(),
          floatingActionButton: FloatingActionButton(
            mini: true,
            child: const Icon(Icons.supervised_user_circle_outlined),
            onPressed: () async {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CharacterSelect()));
            },
          ),
    ),
    );
  }

}

class _TimeDisplay extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announce = ref.watch(announceBoolProvider);
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(announce.time),
    );
  }

}

class _TimeSlider extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announce = ref.watch(announceBoolProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SliderTheme(
        data: const SliderThemeData(
          activeTrackColor: Colors.black12,
          inactiveTrackColor: Colors.black26,
          thumbColor: Colors.teal,
          activeTickMarkColor: Colors.black12,
          inactiveTickMarkColor: Colors.black45,
          trackHeight: 15,
        ),
        child: Slider(
          onChanged: (double value) => ref.read(homeProvider.notifier).pass(value.toInt()),
          value: announce.index.toDouble(),
          min: Announce.ten.index.toDouble(),
          max: Announce.one.index.toDouble(),
          divisions: Announce.values.length -1,
        ),
      ),
    );
  }

}

class _StackBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).majored(_mapKey.currentContext?.size);
    });
    return Stack(
      alignment: const Alignment(0, 0),
      fit: StackFit.expand,
      children: [
        /// 背景のミニマップ
        Align(
            alignment: const Alignment(0, 0),
            child: RepaintBoundary(
              key: _mapKey,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/Remoat-Stadium-miniMap.jpeg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
        ),
        /// ゴール
        Align(
          alignment: const Alignment(0, 0),
          child: _Situation(),
        ),
        /// 味方チーム
        Align(
          alignment: const Alignment(-1, -1),
          child: _StackOwnTeamTeamMember(),
        ),
        /// 敵チーム
        Align(
          alignment: const Alignment(1, -1),
          child: _StackOppositionTeamMember(),
        ),
      ],
    );
  }

}

class _Situation extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(backGroundSizeProvider);
    if(size != null){
      return SizedBox(
        height: size.height,
        width: size.width,
        child: _Positions(),
      );
    }else{
      return Container();
    }
  }
}

class _Positions extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownGoals = ref.watch(ownInvasionProvider);
    final oppositionGoals = ref.watch(oppositionInvasionProvider);
    return Stack(
      children: [
        for(final ownGoal in ownGoals.entries)
          _PositionGoal(color: const Color.fromRGBO(111, 47, 219, 1.0).withOpacity(0.5),own: true, position: ownGoal),
        for(final oppositionGoal in oppositionGoals.entries)
          _PositionGoal(color: const Color.fromRGBO(244, 132, 54, 1.0).withOpacity(0.5),own: false, position: oppositionGoal),
        _Jungle(own: true, color: const Color.fromRGBO(42, 105, 140, 1.0).withOpacity(0.5),),
        _Jungle(own: false, color: const Color.fromRGBO(42, 105, 140, 1.0).withOpacity(0.5),),
        for(final neutral in constNeutralPosition.entries)
          _NeutralPosition(position: neutral, color: const Color.fromRGBO(42, 105, 140, 1.0).withOpacity(0.5),),
      ],
    );
  }
}

class _PositionGoal extends ConsumerWidget{
  final MapEntry<Position, bool> position;
  final bool own;
  final Color color;

  const _PositionGoal({required this.color, required this.position, required this.own});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => own ?
              ref.read(homeProvider.notifier).switchOwnGoal(position.key) :
              ref.read(homeProvider.notifier).switchOppositionGoal(position.key) ,
      child: Align(
        alignment: position.key.alignment,
        child: _Position(position: position, color: color,),
      ),
    );
  }
}

class _NeutralPosition extends StatelessWidget{
  final MapEntry<Position, bool> position;
  final Color color;
  const _NeutralPosition({required this.color, required this.position});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: position.key.alignment,
      child: _Position(position: position, color: color,),
    );
  }
}

class _Jungle extends StatelessWidget{
  final bool own;
  final Color color;
  const _Jungle({required this.color, required this.own});
  @override
  Widget build(BuildContext context) {
    var position = own ? Position.jungle : Position.oppositionJungle;
    return Align(
      alignment: position.alignment,
      child: _Position(position: {position: true}.entries.first, color: color),
    );
  }
}

class _Position extends ConsumerWidget{
  final MapEntry<Position, bool> position;
  final Color color;
  const _Position({required this.color, required this.position});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(backGroundSizeProvider);
    return SizedBox(
      height: 100,
      width: 40 + (size != null ? size.width*8/100 :50),
      child: Row(
        children: [
          _OwnTeamWithPosition(position: position.key,),
          _DragTargetPositionCircle(position: position, color: color,),
          _OppositionTeamWithPosition(position: position.key,),
        ],
      ),
    );
  }
}

class _DragTargetPositionCircle extends ConsumerWidget{
  final MapEntry<Position, bool> position;
  final Color color;
  const _DragTargetPositionCircle({required this.color, required this.position});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(backGroundSizeProvider);
    return DragTarget(
      builder: (context, candidateData, rejectedData) {
        return CircleAvatar(
          radius: size != null ? size.width*8/200 :25,
          backgroundColor: position.value ? color : Colors.transparent,
        );
      },
      onAccept: (Map<Character, bool> data) => ref.read(homeProvider.notifier).setPosition(data, position.key),
    );
  }

}

class _OwnTeamWithPosition extends ConsumerWidget{
  final Position position;
  const _OwnTeamWithPosition({required this.position});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterPos = ref.read(ownCharacterPosProvider);
    if(characterPos.values.contains(position)){
      return SizedBox(
        width: 20,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                for(final pos in characterPos.entries)
                  if(pos.value == position)
                    MiniCharacterView(own: true, character: pos.key,),
          ],
        ),
      );
    }else{
      return const SizedBox(
        width: 20,
        height: 100,
      );
    }
  }
}

class _OppositionTeamWithPosition extends ConsumerWidget{
  final Position position;
  const _OppositionTeamWithPosition({required this.position});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterPos = ref.read(oppositionCharacterPosProvider);
    if(characterPos.values.contains(position)){
      return SizedBox(
        width: 20,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                for(final pos in characterPos.entries)
                  if(pos.value == position)
                    MiniCharacterView(own: false, character: pos.key,),
          ],
        ),
      );
    }else{
      return const SizedBox(
        width: 20,
        height: 100,
      );
    }
  }
}

class _StackOwnTeamTeamMember extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final own = ref.watch(ownTeamMemberProvider).toList();
    final size = ref.watch(backGroundSizeProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: size != null ? (MediaQuery.of(context).size.width - size.width.toDouble())/2 : 100,
      child: ListView(
        children: [
          for(final member in own)
            RepositionableCharacterView(own: true, character: member),
        ],
      )
    );
  }
}

class _StackOppositionTeamMember extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final opposition = ref.watch(oppositionTeamMemberProvider).toList();
    final size = ref.watch(backGroundSizeProvider);
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: size != null ? (MediaQuery.of(context).size.width - size.width.toDouble())/2 : 100,
        child: ListView(
          children: [
            for(final member in opposition)
              RepositionableCharacterView(own: false, character: member),
          ],
        )
    );
  }
}