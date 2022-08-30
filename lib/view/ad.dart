import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:unite_board/viewModel/bannerAdVM.dart';
import 'package:unite_board/viewModel/rewardAdVM.dart';

import '../viewModel/rewardedMonitor.dart';
import 'home.dart';

class RewardedAdView extends ConsumerStatefulWidget{
  const RewardedAdView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return RewardedAdState();
  }
}

class RewardedAdState extends ConsumerState<RewardedAdView>{
  @override
  void initState() {
    super.initState();
    ref.read(rewardAdProvider.notifier).load();
  }
  @override
  Widget build(BuildContext context) {
    final rewarded = ref.watch(rewardAdProvider).completed;
    if(rewarded){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home(),));
        // Navigator.of(context).pop(completed);
      });
      return const Scaffold(
        backgroundColor: Color.fromRGBO(16, 27, 73, 1.0),
      );
    }else{
      return Scaffold(
        backgroundColor: const Color.fromRGBO(16, 27, 73, 1.0),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              Text(
                '動画を見ると一時的にバナーが消えます。\n\n\n広告を読み込んでいます\n\n通信環境の悪い場合や、\n広告ブロックアプリ等を使用している場合、\n広告の再生ができないことがあります。',
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(vertical: 40),
              // ),
              ElevatedButton.icon(
                label: Text(
                  'キャンセル',
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home(),));
                }, icon: const Icon(Icons.arrow_back_ios),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
            ],
          ),
        ),
      );
    }
  }

}

class BannerAdView extends ConsumerStatefulWidget{
  const BannerAdView({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return BannerState();
  }
}

class BannerState extends ConsumerState<BannerAdView>{
  @override
  void initState() {
    super.initState();
    debugPrint('BannerState initState');
    ref.read(bannerAdProvider.notifier).createBanner();
  }
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(rewardedMonitorProvider.notifier).check();
    });
    final ad = ref.watch(bannerAdProvider);
    final rewarded = ref.watch(rewardedMonitorProvider);
    debugPrint('rewarded :$rewarded ad:$ad');
    if(rewarded == null || ad == null){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if(rewarded == true){
      return const SizedBox(
        height: 0,
      );
    }else{
      return SizedBox(
        width: 320,
        height: 50,
        child: AdWidget(
            ad: ad,
        ),
      );
    }
  }

}