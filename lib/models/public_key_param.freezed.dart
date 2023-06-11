// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_key_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicKeyParam _$PublicKeyParamFromJson(Map<String, dynamic> json) {
  return _PublicKeyParam.fromJson(json);
}

/// @nodoc
mixin _$PublicKeyParam {
  int? get alg => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicKeyParamCopyWith<PublicKeyParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicKeyParamCopyWith<$Res> {
  factory $PublicKeyParamCopyWith(
          PublicKeyParam value, $Res Function(PublicKeyParam) then) =
      _$PublicKeyParamCopyWithImpl<$Res, PublicKeyParam>;
  @useResult
  $Res call({int? alg, String? type});
}

/// @nodoc
class _$PublicKeyParamCopyWithImpl<$Res, $Val extends PublicKeyParam>
    implements $PublicKeyParamCopyWith<$Res> {
  _$PublicKeyParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alg = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      alg: freezed == alg
          ? _value.alg
          : alg // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PublicKeyParamCopyWith<$Res>
    implements $PublicKeyParamCopyWith<$Res> {
  factory _$$_PublicKeyParamCopyWith(
          _$_PublicKeyParam value, $Res Function(_$_PublicKeyParam) then) =
      __$$_PublicKeyParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? alg, String? type});
}

/// @nodoc
class __$$_PublicKeyParamCopyWithImpl<$Res>
    extends _$PublicKeyParamCopyWithImpl<$Res, _$_PublicKeyParam>
    implements _$$_PublicKeyParamCopyWith<$Res> {
  __$$_PublicKeyParamCopyWithImpl(
      _$_PublicKeyParam _value, $Res Function(_$_PublicKeyParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alg = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_PublicKeyParam(
      alg: freezed == alg
          ? _value.alg
          : alg // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PublicKeyParam implements _PublicKeyParam {
  const _$_PublicKeyParam({this.alg, this.type});

  factory _$_PublicKeyParam.fromJson(Map<String, dynamic> json) =>
      _$$_PublicKeyParamFromJson(json);

  @override
  final int? alg;
  @override
  final String? type;

  @override
  String toString() {
    return 'PublicKeyParam(alg: $alg, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicKeyParam &&
            (identical(other.alg, alg) || other.alg == alg) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, alg, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicKeyParamCopyWith<_$_PublicKeyParam> get copyWith =>
      __$$_PublicKeyParamCopyWithImpl<_$_PublicKeyParam>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicKeyParamToJson(
      this,
    );
  }
}

abstract class _PublicKeyParam implements PublicKeyParam {
  const factory _PublicKeyParam({final int? alg, final String? type}) =
      _$_PublicKeyParam;

  factory _PublicKeyParam.fromJson(Map<String, dynamic> json) =
      _$_PublicKeyParam.fromJson;

  @override
  int? get alg;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_PublicKeyParamCopyWith<_$_PublicKeyParam> get copyWith =>
      throw _privateConstructorUsedError;
}
