// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:hirehobit/model/profile.dart';
// import 'package:hirehobit/repository/FireStore.dart';
// import 'package:state_notifier/state_notifier.dart';
// import 'package:get_it/get_it.dart';
// import '../repository/admob.dart';
// import 'dart:io' show Platform;
//
// part 'RewardAdmob.freezed.dart';
// final int maxFailedLoadAttempts = 3;
//
// @freezed
// class RewardAdmob with _$RewardAdmob{
//   factory RewardAdmob({
//     /// RewardedAd (null なら ロード未完了)
//     RewardedAd? rewardedAd,
//     /// reward Load count
//     @Default(0) int numRewardedLoadAttempts,
//     /// キャンセル
//     @Default(false) bool completed,
//   }) = _RewardAdmob;
// }
//
// class RewardAdmobVM extends StateNotifier<RewardAdmob> with LocatorMixin, WidgetsBindingObserver {
//   final Profile? profile;
//   RewardAdmobVM(this.profile) : super(RewardAdmob());
//   static final int _maxFailedLoadAttempts = 3;
//   final Admob _admobRepo = GetIt.I<Admob>();
//   final FireStore _fireStoreRepo = GetIt.I<FireStore>();
//   // TODO ターゲッティングセットは必要なのか
//   static final AdRequest request = AdRequest();
//
//   @override
//   void initState() {
//     super.initState();
//     debugPrint('RewardAdmobVM initState');
//     _createRewardedAd();
//   }
//
//   void _createRewardedAd() {
//     debugPrint('_createRewardedAd start ${_admobRepo.adAndroid}');
//     RewardedAd.load(
//         adUnitId: Platform.isAndroid
//             ? _admobRepo.adAndroid
//             : _admobRepo.adIos,
//         request: request,
//         rewardedAdLoadCallback: RewardedAdLoadCallback(
//           onAdLoaded: (RewardedAd ad) {
//             print('$ad loaded.');
//             state = state.copyWith(rewardedAd: ad, numRewardedLoadAttempts: 0);
//             showRewardedAd();
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('RewardedAd failed to load: $error');
//             var count = state.numRewardedLoadAttempts + 1;
//             state = state.copyWith(numRewardedLoadAttempts: count);
//             if (count < _maxFailedLoadAttempts) {
//               _createRewardedAd();
//             }
//           },
//         )
//     );
//   }
//
//   /// Rewarded が null でなくなった場合にコール？
//   void showRewardedAd() {
//     if (state.rewardedAd == null) {
//       print('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     state.rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         _createRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         _createRewardedAd();
//       },
//     );
//     state.rewardedAd!.setImmersiveMode(true);
//     state.rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//           num amount;
//           print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//           if(reward.type == 'coins'){
//             /// case test ad
//             amount = 1;
//           }else{
//             amount = reward.amount;
//           }
//           _fireStoreRepo.updateProfile(profile!.copyWith(cmCount: profile!.cmCount + amount.toInt()));
//           state = state.copyWith(completed: true);
//         });
//     state = state.copyWith(rewardedAd: null);
//   }
// }
//
