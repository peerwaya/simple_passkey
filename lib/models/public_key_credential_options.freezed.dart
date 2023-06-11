// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_key_credential_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicKeyCredentialOptions _$PublicKeyCredentialOptionsFromJson(
    Map<String, dynamic> json) {
  return _PublicKeyCredentialOptions.fromJson(json);
}

/// @nodoc
mixin _$PublicKeyCredentialOptions {
  String get challenge => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  RelyingParty? get rp => throw _privateConstructorUsedError;
  List<PublicKeyParam>? get pubKeyCredParams =>
      throw _privateConstructorUsedError;
  AuthenticatorSelection? get authenticatorSelection =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicKeyCredentialOptionsCopyWith<PublicKeyCredentialOptions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicKeyCredentialOptionsCopyWith<$Res> {
  factory $PublicKeyCredentialOptionsCopyWith(PublicKeyCredentialOptions value,
          $Res Function(PublicKeyCredentialOptions) then) =
      _$PublicKeyCredentialOptionsCopyWithImpl<$Res,
          PublicKeyCredentialOptions>;
  @useResult
  $Res call(
      {String challenge,
      User? user,
      RelyingParty? rp,
      List<PublicKeyParam>? pubKeyCredParams,
      AuthenticatorSelection? authenticatorSelection});

  $UserCopyWith<$Res>? get user;
  $RelyingPartyCopyWith<$Res>? get rp;
  $AuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection;
}

/// @nodoc
class _$PublicKeyCredentialOptionsCopyWithImpl<$Res,
        $Val extends PublicKeyCredentialOptions>
    implements $PublicKeyCredentialOptionsCopyWith<$Res> {
  _$PublicKeyCredentialOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenge = null,
    Object? user = freezed,
    Object? rp = freezed,
    Object? pubKeyCredParams = freezed,
    Object? authenticatorSelection = freezed,
  }) {
    return _then(_value.copyWith(
      challenge: null == challenge
          ? _value.challenge
          : challenge // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      rp: freezed == rp
          ? _value.rp
          : rp // ignore: cast_nullable_to_non_nullable
              as RelyingParty?,
      pubKeyCredParams: freezed == pubKeyCredParams
          ? _value.pubKeyCredParams
          : pubKeyCredParams // ignore: cast_nullable_to_non_nullable
              as List<PublicKeyParam>?,
      authenticatorSelection: freezed == authenticatorSelection
          ? _value.authenticatorSelection
          : authenticatorSelection // ignore: cast_nullable_to_non_nullable
              as AuthenticatorSelection?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RelyingPartyCopyWith<$Res>? get rp {
    if (_value.rp == null) {
      return null;
    }

    return $RelyingPartyCopyWith<$Res>(_value.rp!, (value) {
      return _then(_value.copyWith(rp: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection {
    if (_value.authenticatorSelection == null) {
      return null;
    }

    return $AuthenticatorSelectionCopyWith<$Res>(_value.authenticatorSelection!,
        (value) {
      return _then(_value.copyWith(authenticatorSelection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PublicKeyCredentialOptionsCopyWith<$Res>
    implements $PublicKeyCredentialOptionsCopyWith<$Res> {
  factory _$$_PublicKeyCredentialOptionsCopyWith(
          _$_PublicKeyCredentialOptions value,
          $Res Function(_$_PublicKeyCredentialOptions) then) =
      __$$_PublicKeyCredentialOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String challenge,
      User? user,
      RelyingParty? rp,
      List<PublicKeyParam>? pubKeyCredParams,
      AuthenticatorSelection? authenticatorSelection});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $RelyingPartyCopyWith<$Res>? get rp;
  @override
  $AuthenticatorSelectionCopyWith<$Res>? get authenticatorSelection;
}

/// @nodoc
class __$$_PublicKeyCredentialOptionsCopyWithImpl<$Res>
    extends _$PublicKeyCredentialOptionsCopyWithImpl<$Res,
        _$_PublicKeyCredentialOptions>
    implements _$$_PublicKeyCredentialOptionsCopyWith<$Res> {
  __$$_PublicKeyCredentialOptionsCopyWithImpl(
      _$_PublicKeyCredentialOptions _value,
      $Res Function(_$_PublicKeyCredentialOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? challenge = null,
    Object? user = freezed,
    Object? rp = freezed,
    Object? pubKeyCredParams = freezed,
    Object? authenticatorSelection = freezed,
  }) {
    return _then(_$_PublicKeyCredentialOptions(
      challenge: null == challenge
          ? _value.challenge
          : challenge // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      rp: freezed == rp
          ? _value.rp
          : rp // ignore: cast_nullable_to_non_nullable
              as RelyingParty?,
      pubKeyCredParams: freezed == pubKeyCredParams
          ? _value._pubKeyCredParams
          : pubKeyCredParams // ignore: cast_nullable_to_non_nullable
              as List<PublicKeyParam>?,
      authenticatorSelection: freezed == authenticatorSelection
          ? _value.authenticatorSelection
          : authenticatorSelection // ignore: cast_nullable_to_non_nullable
              as AuthenticatorSelection?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PublicKeyCredentialOptions implements _PublicKeyCredentialOptions {
  const _$_PublicKeyCredentialOptions(
      {required this.challenge,
      this.user,
      this.rp,
      final List<PublicKeyParam>? pubKeyCredParams,
      this.authenticatorSelection})
      : _pubKeyCredParams = pubKeyCredParams;

  factory _$_PublicKeyCredentialOptions.fromJson(Map<String, dynamic> json) =>
      _$$_PublicKeyCredentialOptionsFromJson(json);

  @override
  final String challenge;
  @override
  final User? user;
  @override
  final RelyingParty? rp;
  final List<PublicKeyParam>? _pubKeyCredParams;
  @override
  List<PublicKeyParam>? get pubKeyCredParams {
    final value = _pubKeyCredParams;
    if (value == null) return null;
    if (_pubKeyCredParams is EqualUnmodifiableListView)
      return _pubKeyCredParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final AuthenticatorSelection? authenticatorSelection;

  @override
  String toString() {
    return 'PublicKeyCredentialOptions(challenge: $challenge, user: $user, rp: $rp, pubKeyCredParams: $pubKeyCredParams, authenticatorSelection: $authenticatorSelection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicKeyCredentialOptions &&
            (identical(other.challenge, challenge) ||
                other.challenge == challenge) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.rp, rp) || other.rp == rp) &&
            const DeepCollectionEquality()
                .equals(other._pubKeyCredParams, _pubKeyCredParams) &&
            (identical(other.authenticatorSelection, authenticatorSelection) ||
                other.authenticatorSelection == authenticatorSelection));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      challenge,
      user,
      rp,
      const DeepCollectionEquality().hash(_pubKeyCredParams),
      authenticatorSelection);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicKeyCredentialOptionsCopyWith<_$_PublicKeyCredentialOptions>
      get copyWith => __$$_PublicKeyCredentialOptionsCopyWithImpl<
          _$_PublicKeyCredentialOptions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicKeyCredentialOptionsToJson(
      this,
    );
  }
}

abstract class _PublicKeyCredentialOptions
    implements PublicKeyCredentialOptions {
  const factory _PublicKeyCredentialOptions(
          {required final String challenge,
          final User? user,
          final RelyingParty? rp,
          final List<PublicKeyParam>? pubKeyCredParams,
          final AuthenticatorSelection? authenticatorSelection}) =
      _$_PublicKeyCredentialOptions;

  factory _PublicKeyCredentialOptions.fromJson(Map<String, dynamic> json) =
      _$_PublicKeyCredentialOptions.fromJson;

  @override
  String get challenge;
  @override
  User? get user;
  @override
  RelyingParty? get rp;
  @override
  List<PublicKeyParam>? get pubKeyCredParams;
  @override
  AuthenticatorSelection? get authenticatorSelection;
  @override
  @JsonKey(ignore: true)
  _$$_PublicKeyCredentialOptionsCopyWith<_$_PublicKeyCredentialOptions>
      get copyWith => throw _privateConstructorUsedError;
}
