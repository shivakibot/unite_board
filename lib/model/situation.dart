import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unite_board/model/team.dart';
import 'package:flutter/material.dart';
part 'situation.freezed.dart';

@freezed
class Situation with _$Situation{
  const factory Situation({
    @Default(Score.close) Score score,
    @Default(Announce.ten) Announce time,
    required Team own,
    required Team opposition,
    Size? size,
  }) = _Situation;
}

enum Score{
  bigAdvantage,
  advantage,
  close,
  disAdvantage,
  bigDisAdvantage;
}

enum Announce{
  ten('10:00'),
  eightFifty('8:50'),
  sevenTwenty('7:20'),
  seven('7:00'),
  five('5:00'),
  three('3:00'),
  two('2:00'),
  one('1:00');

  final String time;
  const Announce(this.time);
}