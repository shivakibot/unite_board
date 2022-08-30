// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'RewardAd.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RewardAd {
  /// RewardedAd (null なら ロード未完了)
  RewardedAd? get rewardedAd => throw _privateConstructorUsedError;

  /// reward Load count
  int get numRewardedLoadAttempts => throw _privateConstructorUsedError;

  /// キャンセル
  bool get completed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RewardAdCopyWith<RewardAd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardAdCopyWith<$Res> {
  factory $RewardAdCopyWith(RewardAd value, $Res Function(RewardAd) then) =
      _$RewardAdCopyWithImpl<$Res>;
  $Res call(
      {RewardedAd? rewardedAd, int numRewardedLoadAttempts, bool completed});
}

/// @nodoc
class _$RewardAdCopyWithImpl<$Res> implements $RewardAdCopyWith<$Res> {
  _$RewardAdCopyWithImpl(this._value, this._then);

  final RewardAd _value;
  // ignore: unused_field
  final $Res Function(RewardAd) _then;

  @override
  $Res call({
    Object? rewardedAd = freezed,
    Object? numRewardedLoadAttempts = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      rewardedAd: rewardedAd == freezed
          ? _value.rewardedAd
          : rewardedAd // ignore: cast_nullable_to_non_nullable
              as RewardedAd?,
      numRewardedLoadAttempts: numRewardedLoadAttempts == freezed
          ? _value.numRewardedLoadAttempts
          : numRewardedLoadAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_RewardAdCopyWith<$Res> implements $RewardAdCopyWith<$Res> {
  factory _$$_RewardAdCopyWith(
          _$_RewardAd value, $Res Function(_$_RewardAd) then) =
      __$$_RewardAdCopyWithImpl<$Res>;
  @override
  $Res call(
      {RewardedAd? rewardedAd, int numRewardedLoadAttempts, bool completed});
}

/// @nodoc
class __$$_RewardAdCopyWithImpl<$Res> extends _$RewardAdCopyWithImpl<$Res>
    implements _$$_RewardAdCopyWith<$Res> {
  __$$_RewardAdCopyWithImpl(
      _$_RewardAd _value, $Res Function(_$_RewardAd) _then)
      : super(_value, (v) => _then(v as _$_RewardAd));

  @override
  _$_RewardAd get _value => super._value as _$_RewardAd;

  @override
  $Res call({
    Object? rewardedAd = freezed,
    Object? numRewardedLoadAttempts = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$_RewardAd(
      rewardedAd: rewardedAd == freezed
          ? _value.rewardedAd
          : rewardedAd // ignore: cast_nullable_to_non_nullable
              as RewardedAd?,
      numRewardedLoadAttempts: numRewardedLoadAttempts == freezed
          ? _value.numRewardedLoadAttempts
          : numRewardedLoadAttempts // ignore: cast_nullable_to_non_nullable
              as int,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RewardAd implements _RewardAd {
  _$_RewardAd(
      {this.rewardedAd,
      this.numRewardedLoadAttempts = 0,
      this.completed = false});

  /// RewardedAd (null なら ロード未完了)
  @override
  final RewardedAd? rewardedAd;

  /// reward Load count
  @override
  @JsonKey()
  final int numRewardedLoadAttempts;

  /// キャンセル
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString() {
    return 'RewardAd(rewardedAd: $rewardedAd, numRewardedLoadAttempts: $numRewardedLoadAttempts, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RewardAd &&
            const DeepCollectionEquality()
                .equals(other.rewardedAd, rewardedAd) &&
            const DeepCollectionEquality().equals(
                other.numRewardedLoadAttempts, numRewardedLoadAttempts) &&
            const DeepCollectionEquality().equals(other.completed, completed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rewardedAd),
      const DeepCollectionEquality().hash(numRewardedLoadAttempts),
      const DeepCollectionEquality().hash(completed));

  @JsonKey(ignore: true)
  @override
  _$$_RewardAdCopyWith<_$_RewardAd> get copyWith =>
      __$$_RewardAdCopyWithImpl<_$_RewardAd>(this, _$identity);
}

abstract class _RewardAd implements RewardAd {
  factory _RewardAd(
      {final RewardedAd? rewardedAd,
      final int numRewardedLoadAttempts,
      final bool completed}) = _$_RewardAd;

  @override

  /// RewardedAd (null なら ロード未完了)
  RewardedAd? get rewardedAd;
  @override

  /// reward Load count
  int get numRewardedLoadAttempts;
  @override

  /// キャンセル
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$_RewardAdCopyWith<_$_RewardAd> get copyWith =>
      throw _privateConstructorUsedError;
}
