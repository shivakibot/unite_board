import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/repository/localDb.dart';

final rewardedMonitorProvider = StateNotifierProvider.autoDispose<RewardedMonitorProvider,bool?>(
        (ref) => RewardedMonitorProvider(LocalDb()),
);

class RewardedMonitorProvider extends StateNotifier<bool?>{
  final LocalDb _localDb;
  RewardedMonitorProvider(this._localDb):super(null);

  void check(){
    var past = _localDb.getRewardedDate();
    if(past == null){
      /// 一度も動画視聴していない、またはアプリ初期状態、またはリセット直後
      state = false;
      return;
    }else{
      /// 一度以上視聴済みなのでリワード期間（本日中かどうか）をチェックする
      var now = DateTime.now();
      if(now.isAtSameMomentAs(past)){
        /// アプリ動作中に日付を跨いだので、rewarded をリセットする
        _localDb.resetRewardedTime();
        state = false;
        return;
      }
      /// 初回チェックなのでtrueを入れる。
      /// またはrewarded 期間中なので更新処理は行わない
      if(state == null || state == false){
        state = true;
      }
    }
  }
}