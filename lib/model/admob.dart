class Admob {
  static final Admob _admobRepo = Admob._internal();
  Admob._internal();

  static late String adUnitIdAndroid;
  String get adAndroid => adUnitIdAndroid;
  static late String adUnitIdIos;
  String get adIos => adUnitIdAndroid;
  static const String _demoAdUnitAndroid = 'ca-app-pub-3940256099942544/5224354917';
  static const String _demoAdUnitIos = 'ca-app-pub-3940256099942544/1712485313';
  /// TODO
  static const String _releaseAdUnitAndroid = 'ca-app-pub-5922079786161480/3619071762';
  static const String _releaseAdUnitIos = 'ca-app-pub-5922079786161480/8791507398';
  static const isRelease = bool.fromEnvironment('dart.vm.product');
  factory Admob(){
    if (isRelease) {
      /// テスト環境で isRelease を利用するのは禁止。
      adUnitIdAndroid = _releaseAdUnitAndroid;
      adUnitIdIos = _releaseAdUnitIos;
    }else{
      adUnitIdAndroid = _demoAdUnitAndroid;
      adUnitIdIos = _demoAdUnitIos;
    }
    return _admobRepo;
  }

}