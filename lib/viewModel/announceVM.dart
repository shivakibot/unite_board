import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/situation.dart';
import 'homeVM.dart';

final announceBoolProvider = StateNotifierProvider<AnnounceProvider, Announce>(
        (ref) {
          final time = ref.watch(homeProvider).time;
      return AnnounceProvider(time);
    });


class AnnounceProvider extends StateNotifier<Announce>{
  final Announce _announce;
  AnnounceProvider(this._announce):super(Announce.ten){
    state = _announce;
  }
}