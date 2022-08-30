class Admob {
  static final Admob _admobRepo = Admob._internal();
  static const int _maxFailedLoadAttempts = 3;
  int get maxFailed => _maxFailedLoadAttempts;
  Admob._internal();

  static late String adUnitIdAndroid;
  String get adAndroid => adUnitIdAndroid;
  static late String adUnitBannerIos;
  String get adBannerIos => adUnitBannerIos;
  static late String adUnitRewardIos;
  String get adRewardIos => adUnitRewardIos;
  static const String _demoAdUnitAndroid = 'ca-app-pub-3940256099942544/5224354917';
  static const String _demoAdRewardIos = 'ca-app-pub-3940256099942544/1712485313';
  static const String _demoAdBannerIos = 'ca-app-pub-3940256099942544/2934735716';
  /// TODO
  static const String _releaseAdUnitAndroid = '';
  static const String _releaseAdBannerIos = 'ca-app-pub-5922079786161480/2515362715';
  static const String _releaseAdRewardIos = 'ca-app-pub-5922079786161480/2066153611';
  static const isRelease = bool.fromEnvironment('dart.vm.product');
  factory Admob(){
    if (isRelease) {
      /// テスト環境で isRelease を利用するのは禁止。
      adUnitIdAndroid = _releaseAdUnitAndroid;
      adUnitBannerIos = _releaseAdBannerIos;
      adUnitRewardIos = _releaseAdRewardIos;
    }else{
      adUnitIdAndroid = _demoAdUnitAndroid;
      adUnitBannerIos = _demoAdBannerIos;
      adUnitRewardIos = _demoAdRewardIos;
    }
    return _admobRepo;
  }
}