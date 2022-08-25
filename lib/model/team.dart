import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'character.dart';

part 'team.freezed.dart';

@freezed
class Team with _$Team{
  const factory Team({
    @Default({}) Set<Character> characters,
    @Default({}) Map<Character, Position> characterPos,
    required Map<Position, bool> invasion,
    int? selected,
  }) = _Team;
}

enum Position{
  /// Pixel5 実寸地での調整後
  topFirst(Alignment(-0.26,-0.956)),
  topSecond(Alignment(-0.685,-0.716)),
  center(Alignment(-0.98,-0.08)),
  bottomSecond(Alignment(-0.685,0.564)),
  bottomFirst(Alignment(-0.26,0.814)),
  jungle(Alignment(-0.4975,-0.05)),
  oppositionTopFirst(Alignment(0.26,-0.956)),
  oppositionTopSecond(Alignment(0.665,-0.716)),
  oppositionCenter(Alignment(0.98,-0.06)),
  oppositionBottomSecond(Alignment(0.665,0.574)),
  oppositionBottomFirst(Alignment(0.26,0.814)),
  oppositionJungle(Alignment(0.4625,-0.05)),
  rotom(Alignment(0,-1.0)),
  drednaw(Alignment(0,1.0)),
  zapdos(Alignment(0,-0.05));
  /// 画像中心点とのオフセット調整後データ(Alignment(*,-0.05)) 補正
  // topFirst(Alignment(-0.22,-0.625),Alignment(0.22,-0.625)),
  // topSecond(Alignment(-0.56,-0.475),Alignment(0.56,-0.475)),
  // center(Alignment(-0.81,-0.05),Alignment(0.81,-0.05)),
  // bottomSecond(Alignment(-0.56,0.375),Alignment(0.56,0.375)),
  // bottomFirst(Alignment(-0.22,0.525),Alignment(0.22,0.525));
  /// 画像中心点とのオフセット調整前データ
  // topFirst(Alignment(-0.22,0.575),Alignment(0.22,0.575)),
  // topSecond(Alignment(-0.56,0.425),Alignment(0.56,0.425)),
  // center(Alignment(-0.81,0),Alignment(0.81,0)),
  // bottomSecond(Alignment(-0.56,-0.425),Alignment(0.56,-0.425)),
  // bottomFirst(Alignment(-0.22,-0.575),Alignment(0.22,-0.575));
  final Alignment alignment;
  // final Alignment oppositionSide;
  const Position(this.alignment);
}

final Map<Position, bool> initialOwnGoalValue ={
  Position.topFirst: true,
  Position.topSecond: true,
  Position.center: true,
  Position.bottomSecond: true,
  Position.bottomFirst: true,
};

final Map<Position, bool> initialOppositionGoalValue ={
  Position.oppositionTopFirst: true,
  Position.oppositionTopSecond: true,
  Position.oppositionCenter: true,
  Position.oppositionBottomSecond: true,
  Position.oppositionBottomFirst: true,
};

final Map<Position, bool> constNeutralPosition ={
  // Position.rotom: true,
  // Position.drednaw: true,
  Position.zapdos: true,
};