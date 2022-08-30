
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unite_board/model/RewardAd.dart';
import 'dart:io' show Platform;

import '../model/admob.dart';
import '../repository/localDb.dart';

final rewardAdProvider = StateNotifierProvider<RewardAdProvider,RewardAd>((ref) {
  return RewardAdProvider(Admob(), LocalDb());
});

class RewardAdProvider extends StateNotifier<RewardAd>{
  final Admob _admobRepo;
  final LocalDb _localDb;
  RewardAdProvider(this._admobRepo, this._localDb): super(RewardAd());
  static const AdRequest request = AdRequest();
  void load(){
    debugPrint('call load');
    _createRewardedAd();
  }

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? _admobRepo.adAndroid
            : _admobRepo.adRewardIos,
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            state = state.copyWith(rewardedAd: ad, numRewardedLoadAttempts: 0);
            showRewardedAd();
          },
          onAdFailedToLoad: (LoadAdError error) {
            state = state.copyWith(rewardedAd: null);
            var count = state.numRewardedLoadAttempts + 1;
            state = state.copyWith(numRewardedLoadAttempts: count);
            if (count < _admobRepo.maxFailed) {
              _createRewardedAd();
            }
          },
        )
    );
  }
  /// Rewarded が null でなくなった場合にコール？
  void showRewardedAd() {
    if (state.rewardedAd == null) {
      return;
    }
    state.rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          debugPrint('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        debugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        /// TODO 公式コードでは書いてあるが、IOSでループが発生する原因
        // _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();

        // _createRewardedAd();
      },
    );
    state.rewardedAd!.setImmersiveMode(true);
    state.rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
          num amount;
          debugPrint('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
          if(reward.type == 'coins'){
            /// case test ad
            amount = 1;
          }else{
            amount = reward.amount;
          }
          /// Rewardedの時刻を保存する
          _localDb.setRewardedDate(DateTime.now());
          state = state.copyWith(completed: true);
        });
    state = state.copyWith(rewardedAd: null);
  }

  void execReset(){
    state.copyWith(completed: false);
  }

  void execRewardedDuration(){
    state.copyWith(completed: true);
  }
}