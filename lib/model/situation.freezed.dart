// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'situation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Situation {
  Score get score => throw _privateConstructorUsedError;
  Announce get time => throw _privateConstructorUsedError;
  Team get own => throw _privateConstructorUsedError;
  Team get opposition => throw _privateConstructorUsedError;
  Size? get size => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SituationCopyWith<Situation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SituationCopyWith<$Res> {
  factory $SituationCopyWith(Situation value, $Res Function(Situation) then) =
      _$SituationCopyWithImpl<$Res>;
  $Res call(
      {Score score, Announce time, Team own, Team opposition, Size? size});

  $TeamCopyWith<$Res> get own;
  $TeamCopyWith<$Res> get opposition;
}

/// @nodoc
class _$SituationCopyWithImpl<$Res> implements $SituationCopyWith<$Res> {
  _$SituationCopyWithImpl(this._value, this._then);

  final Situation _value;
  // ignore: unused_field
  final $Res Function(Situation) _then;

  @override
  $Res call({
    Object? score = freezed,
    Object? time = freezed,
    Object? own = freezed,
    Object? opposition = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Score,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Announce,
      own: own == freezed
          ? _value.own
          : own // ignore: cast_nullable_to_non_nullable
              as Team,
      opposition: opposition == freezed
          ? _value.opposition
          : opposition // ignore: cast_nullable_to_non_nullable
              as Team,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size?,
    ));
  }

  @override
  $TeamCopyWith<$Res> get own {
    return $TeamCopyWith<$Res>(_value.own, (value) {
      return _then(_value.copyWith(own: value));
    });
  }

  @override
  $TeamCopyWith<$Res> get opposition {
    return $TeamCopyWith<$Res>(_value.opposition, (value) {
      return _then(_value.copyWith(opposition: value));
    });
  }
}

/// @nodoc
abstract class _$$_SituationCopyWith<$Res> implements $SituationCopyWith<$Res> {
  factory _$$_SituationCopyWith(
          _$_Situation value, $Res Function(_$_Situation) then) =
      __$$_SituationCopyWithImpl<$Res>;
  @override
  $Res call(
      {Score score, Announce time, Team own, Team opposition, Size? size});

  @override
  $TeamCopyWith<$Res> get own;
  @override
  $TeamCopyWith<$Res> get opposition;
}

/// @nodoc
class __$$_SituationCopyWithImpl<$Res> extends _$SituationCopyWithImpl<$Res>
    implements _$$_SituationCopyWith<$Res> {
  __$$_SituationCopyWithImpl(
      _$_Situation _value, $Res Function(_$_Situation) _then)
      : super(_value, (v) => _then(v as _$_Situation));

  @override
  _$_Situation get _value => super._value as _$_Situation;

  @override
  $Res call({
    Object? score = freezed,
    Object? time = freezed,
    Object? own = freezed,
    Object? opposition = freezed,
    Object? size = freezed,
  }) {
    return _then(_$_Situation(
      score: score == freezed
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as Score,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Announce,
      own: own == freezed
          ? _value.own
          : own // ignore: cast_nullable_to_non_nullable
              as Team,
      opposition: opposition == freezed
          ? _value.opposition
          : opposition // ignore: cast_nullable_to_non_nullable
              as Team,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size?,
    ));
  }
}

/// @nodoc

class _$_Situation implements _Situation {
  const _$_Situation(
      {this.score = Score.close,
      this.time = Announce.ten,
      required this.own,
      required this.opposition,
      this.size});

  @override
  @JsonKey()
  final Score score;
  @override
  @JsonKey()
  final Announce time;
  @override
  final Team own;
  @override
  final Team opposition;
  @override
  final Size? size;

  @override
  String toString() {
    return 'Situation(score: $score, time: $time, own: $own, opposition: $opposition, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Situation &&
            const DeepCollectionEquality().equals(other.score, score) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.own, own) &&
            const DeepCollectionEquality()
                .equals(other.opposition, opposition) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(score),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(own),
      const DeepCollectionEquality().hash(opposition),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  _$$_SituationCopyWith<_$_Situation> get copyWith =>
      __$$_SituationCopyWithImpl<_$_Situation>(this, _$identity);
}

abstract class _Situation implements Situation {
  const factory _Situation(
      {final Score score,
      final Announce time,
      required final Team own,
      required final Team opposition,
      final Size? size}) = _$_Situation;

  @override
  Score get score;
  @override
  Announce get time;
  @override
  Team get own;
  @override
  Team get opposition;
  @override
  Size? get size;
  @override
  @JsonKey(ignore: true)
  _$$_SituationCopyWith<_$_Situation> get copyWith =>
      throw _privateConstructorUsedError;
}
