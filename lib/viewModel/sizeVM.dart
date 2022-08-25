import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unite_board/viewModel/homeVM.dart';
import 'package:flutter/material.dart';

final backGroundSizeProvider = StateNotifierProvider<BackGroundSizeProvider, Size?>(
        (ref) {
          final size = ref.watch(homeProvider).size;
          return BackGroundSizeProvider(size);
        });


class BackGroundSizeProvider extends StateNotifier<Size?>{
  final Size? _size;
  BackGroundSizeProvider(this._size):super(null){
    if(_size != null){
      state = _size!;
    }
  }

}