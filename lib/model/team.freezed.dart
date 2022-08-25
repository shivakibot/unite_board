// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'team.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Team {
  Set<Character> get characters => throw _privateConstructorUsedError;
  Map<Character, Position> get characterPos =>
      throw _privateConstructorUsedError;
  Map<Position, bool> get invasion => throw _privateConstructorUsedError;
  int? get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeamCopyWith<Team> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamCopyWith<$Res> {
  factory $TeamCopyWith(Team value, $Res Function(Team) then) =
      _$TeamCopyWithImpl<$Res>;
  $Res call(
      {Set<Character> characters,
      Map<Character, Position> characterPos,
      Map<Position, bool> invasion,
      int? selected});
}

/// @nodoc
class _$TeamCopyWithImpl<$Res> implements $TeamCopyWith<$Res> {
  _$TeamCopyWithImpl(this._value, this._then);

  final Team _value;
  // ignore: unused_field
  final $Res Function(Team) _then;

  @override
  $Res call({
    Object? characters = freezed,
    Object? characterPos = freezed,
    Object? invasion = freezed,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as Set<Character>,
      characterPos: characterPos == freezed
          ? _value.characterPos
          : characterPos // ignore: cast_nullable_to_non_nullable
              as Map<Character, Position>,
      invasion: invasion == freezed
          ? _value.invasion
          : invasion // ignore: cast_nullable_to_non_nullable
              as Map<Position, bool>,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TeamCopyWith<$Res> implements $TeamCopyWith<$Res> {
  factory _$$_TeamCopyWith(_$_Team value, $Res Function(_$_Team) then) =
      __$$_TeamCopyWithImpl<$Res>;
  @override
  $Res call(
      {Set<Character> characters,
      Map<Character, Position> characterPos,
      Map<Position, bool> invasion,
      int? selected});
}

/// @nodoc
class __$$_TeamCopyWithImpl<$Res> extends _$TeamCopyWithImpl<$Res>
    implements _$$_TeamCopyWith<$Res> {
  __$$_TeamCopyWithImpl(_$_Team _value, $Res Function(_$_Team) _then)
      : super(_value, (v) => _then(v as _$_Team));

  @override
  _$_Team get _value => super._value as _$_Team;

  @override
  $Res call({
    Object? characters = freezed,
    Object? characterPos = freezed,
    Object? invasion = freezed,
    Object? selected = freezed,
  }) {
    return _then(_$_Team(
      characters: characters == freezed
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as Set<Character>,
      characterPos: characterPos == freezed
          ? _value._characterPos
          : characterPos // ignore: cast_nullable_to_non_nullable
              as Map<Character, Position>,
      invasion: invasion == freezed
          ? _value._invasion
          : invasion // ignore: cast_nullable_to_non_nullable
              as Map<Position, bool>,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Team implements _Team {
  const _$_Team(
      {final Set<Character> characters = const {},
      final Map<Character, Position> characterPos = const {},
      required final Map<Position, bool> invasion,
      this.selected})
      : _characters = characters,
        _characterPos = characterPos,
        _invasion = invasion;

  final Set<Character> _characters;
  @override
  @JsonKey()
  Set<Character> get characters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_characters);
  }

  final Map<Character, Position> _characterPos;
  @override
  @JsonKey()
  Map<Character, Position> get characterPos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_characterPos);
  }

  final Map<Position, bool> _invasion;
  @override
  Map<Position, bool> get invasion {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_invasion);
  }

  @override
  final int? selected;

  @override
  String toString() {
    return 'Team(characters: $characters, characterPos: $characterPos, invasion: $invasion, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Team &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            const DeepCollectionEquality()
                .equals(other._characterPos, _characterPos) &&
            const DeepCollectionEquality().equals(other._invasion, _invasion) &&
            const DeepCollectionEquality().equals(other.selected, selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_characters),
      const DeepCollectionEquality().hash(_characterPos),
      const DeepCollectionEquality().hash(_invasion),
      const DeepCollectionEquality().hash(selected));

  @JsonKey(ignore: true)
  @override
  _$$_TeamCopyWith<_$_Team> get copyWith =>
      __$$_TeamCopyWithImpl<_$_Team>(this, _$identity);
}

abstract class _Team implements Team {
  const factory _Team(
      {final Set<Character> characters,
      final Map<Character, Position> characterPos,
      required final Map<Position, bool> invasion,
      final int? selected}) = _$_Team;

  @override
  Set<Character> get characters;
  @override
  Map<Character, Position> get characterPos;
  @override
  Map<Position, bool> get invasion;
  @override
  int? get selected;
  @override
  @JsonKey(ignore: true)
  _$$_TeamCopyWith<_$_Team> get copyWith => throw _privateConstructorUsedError;
}
