import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unite_board/model/RewardAd.dart';
import 'dart:io' show Platform;

import '../model/admob.dart';

final bannerAdProvider = StateNotifierProvider<BannerAdProvider,BannerAd?>((ref) {
  return BannerAdProvider(Admob());
});

class BannerAdProvider extends StateNotifier<BannerAd?>{
  final Admob _admob;
  static const AdRequest request = AdRequest();
  BannerAdProvider(this._admob):super(null);

  Future<void> createBanner(){
    BannerAdListener bannerListener = BannerAdListener(
      onAdLoaded: (ad){
        state = ad as BannerAd;
      },
      onAdFailedToLoad: (ad, error) {
        state?.dispose();
      },
    );
    var bannerAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? _admob.adAndroid
          : _admob.adBannerIos,
      listener: bannerListener,
      request: request,
      size: AdSize.banner,
    );
    return bannerAd.load();
  }

  void disposeAd(){
    state?.dispose();
  }
}