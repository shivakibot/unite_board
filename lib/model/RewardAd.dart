import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'RewardAd.freezed.dart';
@freezed
class RewardAd with _$RewardAd{
  factory RewardAd({
    /// RewardedAd (null なら ロード未完了)
    RewardedAd? rewardedAd,
    /// reward Load count
    @Default(0) int numRewardedLoadAttempts,
    /// キャンセル
    @Default(false) bool completed,
  }) = _RewardAd;
}


