import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashProvider = StateNotifierProvider<SplashProvider, bool>(
        (ref) {
      return SplashProvider();
    });


class SplashProvider extends StateNotifier<bool>{
  SplashProvider():super(false);

  void triggered(){
    state = true;
  }
}