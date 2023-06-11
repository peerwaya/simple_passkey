// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authenticator_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthenticatorSelection _$AuthenticatorSelectionFromJson(
    Map<String, dynamic> json) {
  return _AuthenticatorSelection.fromJson(json);
}

/// @nodoc
mixin _$AuthenticatorSelection {
  AuthenticatorAttachment? get authenticatorAttachment =>
      throw _privateConstructorUsedError;
  AuthenticatorUserVerification? get userVerification =>
      throw _privateConstructorUsedError;
  bool? get requireResidentKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticatorSelectionCopyWith<AuthenticatorSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatorSelectionCopyWith<$Res> {
  factory $AuthenticatorSelectionCopyWith(AuthenticatorSelection value,
          $Res Function(AuthenticatorSelection) then) =
      _$AuthenticatorSelectionCopyWithImpl<$Res, AuthenticatorSelection>;
  @useResult
  $Res call(
      {AuthenticatorAttachment? authenticatorAttachment,
      AuthenticatorUserVerification? userVerification,
      bool? requireResidentKey});
}

/// @nodoc
class _$AuthenticatorSelectionCopyWithImpl<$Res,
        $Val extends AuthenticatorSelection>
    implements $AuthenticatorSelectionCopyWith<$Res> {
  _$AuthenticatorSelectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticatorAttachment = freezed,
    Object? userVerification = freezed,
    Object? requireResidentKey = freezed,
  }) {
    return _then(_value.copyWith(
      authenticatorAttachment: freezed == authenticatorAttachment
          ? _value.authenticatorAttachment
          : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
              as AuthenticatorAttachment?,
      userVerification: freezed == userVerification
          ? _value.userVerification
          : userVerification // ignore: cast_nullable_to_non_nullable
              as AuthenticatorUserVerification?,
      requireResidentKey: freezed == requireResidentKey
          ? _value.requireResidentKey
          : requireResidentKey // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticatorSelectionCopyWith<$Res>
    implements $AuthenticatorSelectionCopyWith<$Res> {
  factory _$$_AuthenticatorSelectionCopyWith(_$_AuthenticatorSelection value,
          $Res Function(_$_AuthenticatorSelection) then) =
      __$$_AuthenticatorSelectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthenticatorAttachment? authenticatorAttachment,
      AuthenticatorUserVerification? userVerification,
      bool? requireResidentKey});
}

/// @nodoc
class __$$_AuthenticatorSelectionCopyWithImpl<$Res>
    extends _$AuthenticatorSelectionCopyWithImpl<$Res,
        _$_AuthenticatorSelection>
    implements _$$_AuthenticatorSelectionCopyWith<$Res> {
  __$$_AuthenticatorSelectionCopyWithImpl(_$_AuthenticatorSelection _value,
      $Res Function(_$_AuthenticatorSelection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authenticatorAttachment = freezed,
    Object? userVerification = freezed,
    Object? requireResidentKey = freezed,
  }) {
    return _then(_$_AuthenticatorSelection(
      authenticatorAttachment: freezed == authenticatorAttachment
          ? _value.authenticatorAttachment
          : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
              as AuthenticatorAttachment?,
      userVerification: freezed == userVerification
          ? _value.userVerification
          : userVerification // ignore: cast_nullable_to_non_nullable
              as AuthenticatorUserVerification?,
      requireResidentKey: freezed == requireResidentKey
          ? _value.requireResidentKey
          : requireResidentKey // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AuthenticatorSelection implements _AuthenticatorSelection {
  const _$_AuthenticatorSelection(
      {this.authenticatorAttachment = AuthenticatorAttachment.platform,
      this.userVerification = AuthenticatorUserVerification.preferred,
      this.requireResidentKey});

  factory _$_AuthenticatorSelection.fromJson(Map<String, dynamic> json) =>
      _$$_AuthenticatorSelectionFromJson(json);

  @override
  @JsonKey()
  final AuthenticatorAttachment? authenticatorAttachment;
  @override
  @JsonKey()
  final AuthenticatorUserVerification? userVerification;
  @override
  final bool? requireResidentKey;

  @override
  String toString() {
    return 'AuthenticatorSelection(authenticatorAttachment: $authenticatorAttachment, userVerification: $userVerification, requireResidentKey: $requireResidentKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatorSelection &&
            (identical(
                    other.authenticatorAttachment, authenticatorAttachment) ||
                other.authenticatorAttachment == authenticatorAttachment) &&
            (identical(other.userVerification, userVerification) ||
                other.userVerification == userVerification) &&
            (identical(other.requireResidentKey, requireResidentKey) ||
                other.requireResidentKey == requireResidentKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, authenticatorAttachment,
      userVerification, requireResidentKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatorSelectionCopyWith<_$_AuthenticatorSelection> get copyWith =>
      __$$_AuthenticatorSelectionCopyWithImpl<_$_AuthenticatorSelection>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticatorSelectionToJson(
      this,
    );
  }
}

abstract class _AuthenticatorSelection implements AuthenticatorSelection {
  const factory _AuthenticatorSelection(
      {final AuthenticatorAttachment? authenticatorAttachment,
      final AuthenticatorUserVerification? userVerification,
      final bool? requireResidentKey}) = _$_AuthenticatorSelection;

  factory _AuthenticatorSelection.fromJson(Map<String, dynamic> json) =
      _$_AuthenticatorSelection.fromJson;

  @override
  AuthenticatorAttachment? get authenticatorAttachment;
  @override
  AuthenticatorUserVerification? get userVerification;
  @override
  bool? get requireResidentKey;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticatorSelectionCopyWith<_$_AuthenticatorSelection> get copyWith =>
      throw _privateConstructorUsedError;
}
