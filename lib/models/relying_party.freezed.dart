// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relying_party.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RelyingParty _$RelyingPartyFromJson(Map<String, dynamic> json) {
  return _RelyingParty.fromJson(json);
}

/// @nodoc
mixin _$RelyingParty {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelyingPartyCopyWith<RelyingParty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelyingPartyCopyWith<$Res> {
  factory $RelyingPartyCopyWith(
          RelyingParty value, $Res Function(RelyingParty) then) =
      _$RelyingPartyCopyWithImpl<$Res, RelyingParty>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class _$RelyingPartyCopyWithImpl<$Res, $Val extends RelyingParty>
    implements $RelyingPartyCopyWith<$Res> {
  _$RelyingPartyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RelyingPartyCopyWith<$Res>
    implements $RelyingPartyCopyWith<$Res> {
  factory _$$_RelyingPartyCopyWith(
          _$_RelyingParty value, $Res Function(_$_RelyingParty) then) =
      __$$_RelyingPartyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$_RelyingPartyCopyWithImpl<$Res>
    extends _$RelyingPartyCopyWithImpl<$Res, _$_RelyingParty>
    implements _$$_RelyingPartyCopyWith<$Res> {
  __$$_RelyingPartyCopyWithImpl(
      _$_RelyingParty _value, $Res Function(_$_RelyingParty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_RelyingParty(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RelyingParty implements _RelyingParty {
  const _$_RelyingParty({this.id, this.name});

  factory _$_RelyingParty.fromJson(Map<String, dynamic> json) =>
      _$$_RelyingPartyFromJson(json);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'RelyingParty(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelyingParty &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RelyingPartyCopyWith<_$_RelyingParty> get copyWith =>
      __$$_RelyingPartyCopyWithImpl<_$_RelyingParty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RelyingPartyToJson(
      this,
    );
  }
}

abstract class _RelyingParty implements RelyingParty {
  const factory _RelyingParty({final String? id, final String? name}) =
      _$_RelyingParty;

  factory _RelyingParty.fromJson(Map<String, dynamic> json) =
      _$_RelyingParty.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_RelyingPartyCopyWith<_$_RelyingParty> get copyWith =>
      throw _privateConstructorUsedError;
}
