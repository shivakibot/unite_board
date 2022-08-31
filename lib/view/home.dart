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
import 'package:unite_board/model/ProfileCommand.dart';
import 'package:unite_board/view/ad.dart';
import 'package:unite_board/viewModel/rewardedMonitor.dart';
import 'package:unite_board/view/info.dart';

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
          body: _FlexibleBody(),
            floatingActionButton: _FloatingButtons(),
          bottomNavigationBar: const BannerAdView(),
    ),
    );
  }
}

class _FloatingButtons extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewarded = ref.watch(rewardedMonitorProvider);
    return Padding(
      padding: const EdgeInsets.only(right: 90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if(rewarded == null || rewarded == false)
            Transform.scale(
            scaleX: 0.7,
            scaleY: 0.7,
            child: FloatingActionButton(
              heroTag: 'rewarded',
              mini: true,
              child: const Text('CM'),
              onPressed: () async {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RewardedAdView()));
              },
            ),
          ),
          Transform.scale(
            scaleX: 0.7,
            scaleY: 0.7,
            child: FloatingActionButton(
              heroTag: 'setting',
              mini: true,
              child: const Icon(Icons.settings),
              onPressed: () {
                showModalBottomSheet<ProfileCommand>(
                  context: context,
                  builder: (context) {
                    return _SettingGrid();
                  },
                ).then((command) {
                  if(command != null){
                    switch(command){
                    // case ProfileCommand.RENAME:
                    //   Navigator.of(context).pushReplacement(fadeTransitionRoute(EditProvider(profile: profile, mode: EditMode.PROFILE,)));
                    //   break;
                    // case ProfileCommand.THUMBNAIL:
                    // /// TODO editThumbnail
                    //   break;
                      case ProfileCommand.LICENCE:
                        showLicensePage(context: context);
                        break;
                      case ProfileCommand.INFO:
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Info(),));
                        break;
                    // /// TODO PRIVACY launch
                    //   case ProfileCommand.PRIVACY:
                    //     launch('https://aside-jp.studio.site/privacy');
                    //     break;
                    // /// TODO TOS launch
                    //   case ProfileCommand.TOS:
                    //     launch('https://aside-jp.studio.site/tos');
                    //     break;
                      default:

                    }
                  }
                  // 何もしない
                });
              },
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 0),
          // ),
          FloatingActionButton(
            heroTag: 'member',
            mini: true,
            child: const Icon(Icons.supervised_user_circle_outlined),
            onPressed: () async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CharacterSelect()));
            },
          ),
        ],
      ),
    );
  }

}

class _SettingMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(100, 150, 150, 1.0)),
        shape: MaterialStateProperty.all<CircleBorder>(const CircleBorder(
            side: BorderSide(
              color: Color.fromRGBO(100, 150, 150, 1.0),
              width: 2,
            )))
      ),
      child: const Icon(Icons.settings,color: Colors.white,),
      onPressed: () {
        showModalBottomSheet<ProfileCommand>(
          context: context,
          builder: (context) {
            return _SettingGrid();
          },
        ).then((command) {
          if(command != null){
            switch(command){
              // case ProfileCommand.RENAME:
              //   Navigator.of(context).pushReplacement(fadeTransitionRoute(EditProvider(profile: profile, mode: EditMode.PROFILE,)));
              //   break;
              // case ProfileCommand.THUMBNAIL:
              // /// TODO editThumbnail
              //   break;
              case ProfileCommand.LICENCE:
                showLicensePage(context: context);
                break;
            // /// TODO PRIVACY launch
            //   case ProfileCommand.PRIVACY:
            //     launch('https://aside-jp.studio.site/privacy');
            //     break;
            // /// TODO TOS launch
            //   case ProfileCommand.TOS:
            //     launch('https://aside-jp.studio.site/tos');
            //     break;
              case ProfileCommand.INFO:
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Info(),));
                break;
              default:

            }
          }
          // 何もしない
        });
      },
    );
  }
}

class _SettingGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(42, 105, 140, 1.0),
      child: Wrap(
        textDirection: TextDirection.rtl,
        children: const [
          // _SettingButton(
          //     text: 'ユーザー名変更',
          //     command:ProfileCommand.RENAME,
          //     icon: Icons.drive_file_rename_outline_rounded
          // ),
          // _SettingButton(
          //     text: '',
          //     command:ProfileCommand.NON,
          //     icon: Icons.drive_file_rename_outline_rounded
          // ),
          // _SettingButton(
          //     text: '',
          //     command:ProfileCommand.NON,
          //     icon: Icons.drive_file_rename_outline_rounded
          // ),
          _SettingButton(
              text: 'このアプリについて',
              command:ProfileCommand.INFO,
              icon: Icons.info_outline
          ),
          _SettingButton(
              text: 'ライセンス表示',
              command:ProfileCommand.LICENCE,
              icon: Icons.text_snippet_outlined
          ),
          // _SettingButton(
          //     text: '利用規約',
          //     command:ProfileCommand.TOS,
          //     icon: Icons.safety_divider_outlined
          // ),
          // _SettingButton(
          //     text: 'プライバシーポリシー',
          //     command:ProfileCommand.PRIVACY,
          //     icon: Icons.policy_outlined
          // ),
        ],

      ),
    );
  }
}

class _SettingButton extends StatelessWidget{
  final IconData icon;
  final String text;
  final ProfileCommand command;

  const _SettingButton({required this.icon, required this.text,required this.command}) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromRGBO(42, 105, 140, 1.0),
      padding: const EdgeInsets.all(10),
      // height: MediaQuery.of(context).size.width/6,
      width: MediaQuery.of(context).size.width/3,
      child: command != ProfileCommand.NON ? RawMaterialButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: Colors.white,),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        onPressed: (){
          Navigator.of(context).pop(command);
        },
      ) : Container(),
    );
  }
}

class _TimeDisplay extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announce = ref.watch(announceBoolProvider);
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
            announce.time,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
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

class _FlexibleBody extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).majored(_mapKey.currentContext?.size);
    });
    return Row(
      children: [
        Expanded(
          // flex: 1,
          child: _StackOwnTeamTeamMember(),
        ),
        Flexible(
            flex: 3,
            child: RepaintBoundary(
              key: _mapKey,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Remoat-Stadium-miniMap.jpeg'),
                        fit: BoxFit.fitHeight,
                        opacity: 0.5
                    )
                ),
                child: _FlexibleSituation(),
              ),
            )),
        Expanded(
          // flex: 1,
          child: _StackOppositionTeamMember(),
        ),
      ],
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

class _FlexibleSituation extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(backGroundSizeProvider);
    if(size != null){
      return _Positions();
    }else{
      return Container();
    }
  }
}

class _Situation extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = ref.watch(backGroundSizeProvider);
    // final rewarded = ref.watch(rewardAdProvider).completed;
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
    double aspect;
    final ownGoals = ref.watch(ownInvasionProvider);
    final oppositionGoals = ref.watch(oppositionInvasionProvider);
    final rewarded = ref.watch(rewardedMonitorProvider);
    if(rewarded != null && rewarded == true){
      aspect = 1.0;
    }else{
      aspect = (MediaQuery.of(context).size.height - 50)/MediaQuery.of(context).size.height;
    }
    return Transform.scale(
      scaleY: 1.0,
      scaleX: aspect,
      child: Stack(
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
      ),
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
    // final rewarded = ref.watch(rewardAdProvider).completed;
    return SizedBox(
      // height: rewarded ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height - 50,
      child: Column(
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
    // final rewarded = ref.watch(rewardAdProvider).completed;
    return SizedBox(
        // height: rewarded ? MediaQuery.of(context).size.height: MediaQuery.of(context).size.height - 50,
        child: Column(
          children: [
            for(final member in opposition)
              RepositionableCharacterView(own: false, character: member),
          ],
        )
    );
  }
}