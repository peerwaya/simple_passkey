// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicKeyCredential _$PublicKeyCredentialFromJson(Map<String, dynamic> json) {
  return _PublicKeyCredentialOptions.fromJson(json);
}

/// @nodoc
mixin _$PublicKeyCredential {
  String get id => throw _privateConstructorUsedError;
  String get rawId => throw _privateConstructorUsedError;
  AuthenticatorAssertionResponse get response =>
      throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  AuthenticatorAttachment? get authenticatorAttachment =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicKeyCredentialCopyWith<PublicKeyCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicKeyCredentialCopyWith<$Res> {
  factory $PublicKeyCredentialCopyWith(
          PublicKeyCredential value, $Res Function(PublicKeyCredential) then) =
      _$PublicKeyCredentialCopyWithImpl<$Res, PublicKeyCredential>;
  @useResult
  $Res call(
      {String id,
      String rawId,
      AuthenticatorAssertionResponse response,
      String type,
      AuthenticatorAttachment? authenticatorAttachment});

  $AuthenticatorAssertionResponseCopyWith<$Res> get response;
}

/// @nodoc
class _$PublicKeyCredentialCopyWithImpl<$Res, $Val extends PublicKeyCredential>
    implements $PublicKeyCredentialCopyWith<$Res> {
  _$PublicKeyCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rawId = null,
    Object? response = null,
    Object? type = null,
    Object? authenticatorAttachment = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rawId: null == rawId
          ? _value.rawId
          : rawId // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AuthenticatorAssertionResponse,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      authenticatorAttachment: freezed == authenticatorAttachment
          ? _value.authenticatorAttachment
          : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
              as AuthenticatorAttachment?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AuthenticatorAssertionResponseCopyWith<$Res> get response {
    return $AuthenticatorAssertionResponseCopyWith<$Res>(_value.response,
        (value) {
      return _then(_value.copyWith(response: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PublicKeyCredentialOptionsCopyWith<$Res>
    implements $PublicKeyCredentialCopyWith<$Res> {
  factory _$$_PublicKeyCredentialOptionsCopyWith(
          _$_PublicKeyCredentialOptions value,
          $Res Function(_$_PublicKeyCredentialOptions) then) =
      __$$_PublicKeyCredentialOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String rawId,
      AuthenticatorAssertionResponse response,
      String type,
      AuthenticatorAttachment? authenticatorAttachment});

  @override
  $AuthenticatorAssertionResponseCopyWith<$Res> get response;
}

/// @nodoc
class __$$_PublicKeyCredentialOptionsCopyWithImpl<$Res>
    extends _$PublicKeyCredentialCopyWithImpl<$Res,
        _$_PublicKeyCredentialOptions>
    implements _$$_PublicKeyCredentialOptionsCopyWith<$Res> {
  __$$_PublicKeyCredentialOptionsCopyWithImpl(
      _$_PublicKeyCredentialOptions _value,
      $Res Function(_$_PublicKeyCredentialOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rawId = null,
    Object? response = null,
    Object? type = null,
    Object? authenticatorAttachment = freezed,
  }) {
    return _then(_$_PublicKeyCredentialOptions(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rawId: null == rawId
          ? _value.rawId
          : rawId // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AuthenticatorAssertionResponse,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      authenticatorAttachment: freezed == authenticatorAttachment
          ? _value.authenticatorAttachment
          : authenticatorAttachment // ignore: cast_nullable_to_non_nullable
              as AuthenticatorAttachment?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_PublicKeyCredentialOptions implements _PublicKeyCredentialOptions {
  const _$_PublicKeyCredentialOptions(
      {required this.id,
      required this.rawId,
      required this.response,
      required this.type,
      this.authenticatorAttachment});

  factory _$_PublicKeyCredentialOptions.fromJson(Map<String, dynamic> json) =>
      _$$_PublicKeyCredentialOptionsFromJson(json);

  @override
  final String id;
  @override
  final String rawId;
  @override
  final AuthenticatorAssertionResponse response;
  @override
  final String type;
  @override
  final AuthenticatorAttachment? authenticatorAttachment;

  @override
  String toString() {
    return 'PublicKeyCredential(id: $id, rawId: $rawId, response: $response, type: $type, authenticatorAttachment: $authenticatorAttachment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicKeyCredentialOptions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rawId, rawId) || other.rawId == rawId) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(
                    other.authenticatorAttachment, authenticatorAttachment) ||
                other.authenticatorAttachment == authenticatorAttachment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, rawId, response, type, authenticatorAttachment);

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

abstract class _PublicKeyCredentialOptions implements PublicKeyCredential {
  const factory _PublicKeyCredentialOptions(
          {required final String id,
          required final String rawId,
          required final AuthenticatorAssertionResponse response,
          required final String type,
          final AuthenticatorAttachment? authenticatorAttachment}) =
      _$_PublicKeyCredentialOptions;

  factory _PublicKeyCredentialOptions.fromJson(Map<String, dynamic> json) =
      _$_PublicKeyCredentialOptions.fromJson;

  @override
  String get id;
  @override
  String get rawId;
  @override
  AuthenticatorAssertionResponse get response;
  @override
  String get type;
  @override
  AuthenticatorAttachment? get authenticatorAttachment;
  @override
  @JsonKey(ignore: true)
  _$$_PublicKeyCredentialOptionsCopyWith<_$_PublicKeyCredentialOptions>
      get copyWith => throw _privateConstructorUsedError;
}

AuthenticatorAssertionResponse _$AuthenticatorAssertionResponseFromJson(
    Map<String, dynamic> json) {
  return _AuthenticatorAssertionResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthenticatorAssertionResponse {
  String get clientDataJSON => throw _privateConstructorUsedError;
  String get authenticatorData => throw _privateConstructorUsedError;
  String get signature => throw _privateConstructorUsedError;
  String? get userHandle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticatorAssertionResponseCopyWith<AuthenticatorAssertionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticatorAssertionResponseCopyWith<$Res> {
  factory $AuthenticatorAssertionResponseCopyWith(
          AuthenticatorAssertionResponse value,
          $Res Function(AuthenticatorAssertionResponse) then) =
      _$AuthenticatorAssertionResponseCopyWithImpl<$Res,
          AuthenticatorAssertionResponse>;
  @useResult
  $Res call(
      {String clientDataJSON,
      String authenticatorData,
      String signature,
      String? userHandle});
}

/// @nodoc
class _$AuthenticatorAssertionResponseCopyWithImpl<$Res,
        $Val extends AuthenticatorAssertionResponse>
    implements $AuthenticatorAssertionResponseCopyWith<$Res> {
  _$AuthenticatorAssertionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientDataJSON = null,
    Object? authenticatorData = null,
    Object? signature = null,
    Object? userHandle = freezed,
  }) {
    return _then(_value.copyWith(
      clientDataJSON: null == clientDataJSON
          ? _value.clientDataJSON
          : clientDataJSON // ignore: cast_nullable_to_non_nullable
              as String,
      authenticatorData: null == authenticatorData
          ? _value.authenticatorData
          : authenticatorData // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      userHandle: freezed == userHandle
          ? _value.userHandle
          : userHandle // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticatorAssertionResponseCopyWith<$Res>
    implements $AuthenticatorAssertionResponseCopyWith<$Res> {
  factory _$$_AuthenticatorAssertionResponseCopyWith(
          _$_AuthenticatorAssertionResponse value,
          $Res Function(_$_AuthenticatorAssertionResponse) then) =
      __$$_AuthenticatorAssertionResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String clientDataJSON,
      String authenticatorData,
      String signature,
      String? userHandle});
}

/// @nodoc
class __$$_AuthenticatorAssertionResponseCopyWithImpl<$Res>
    extends _$AuthenticatorAssertionResponseCopyWithImpl<$Res,
        _$_AuthenticatorAssertionResponse>
    implements _$$_AuthenticatorAssertionResponseCopyWith<$Res> {
  __$$_AuthenticatorAssertionResponseCopyWithImpl(
      _$_AuthenticatorAssertionResponse _value,
      $Res Function(_$_AuthenticatorAssertionResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientDataJSON = null,
    Object? authenticatorData = null,
    Object? signature = null,
    Object? userHandle = freezed,
  }) {
    return _then(_$_AuthenticatorAssertionResponse(
      clientDataJSON: null == clientDataJSON
          ? _value.clientDataJSON
          : clientDataJSON // ignore: cast_nullable_to_non_nullable
              as String,
      authenticatorData: null == authenticatorData
          ? _value.authenticatorData
          : authenticatorData // ignore: cast_nullable_to_non_nullable
              as String,
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      userHandle: freezed == userHandle
          ? _value.userHandle
          : userHandle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_AuthenticatorAssertionResponse
    implements _AuthenticatorAssertionResponse {
  const _$_AuthenticatorAssertionResponse(
      {required this.clientDataJSON,
      required this.authenticatorData,
      required this.signature,
      this.userHandle});

  factory _$_AuthenticatorAssertionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_AuthenticatorAssertionResponseFromJson(json);

  @override
  final String clientDataJSON;
  @override
  final String authenticatorData;
  @override
  final String signature;
  @override
  final String? userHandle;

  @override
  String toString() {
    return 'AuthenticatorAssertionResponse(clientDataJSON: $clientDataJSON, authenticatorData: $authenticatorData, signature: $signature, userHandle: $userHandle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticatorAssertionResponse &&
            (identical(other.clientDataJSON, clientDataJSON) ||
                other.clientDataJSON == clientDataJSON) &&
            (identical(other.authenticatorData, authenticatorData) ||
                other.authenticatorData == authenticatorData) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.userHandle, userHandle) ||
                other.userHandle == userHandle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, clientDataJSON, authenticatorData, signature, userHandle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticatorAssertionResponseCopyWith<_$_AuthenticatorAssertionResponse>
      get copyWith => __$$_AuthenticatorAssertionResponseCopyWithImpl<
          _$_AuthenticatorAssertionResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthenticatorAssertionResponseToJson(
      this,
    );
  }
}

abstract class _AuthenticatorAssertionResponse
    implements AuthenticatorAssertionResponse {
  const factory _AuthenticatorAssertionResponse(
      {required final String clientDataJSON,
      required final String authenticatorData,
      required final String signature,
      final String? userHandle}) = _$_AuthenticatorAssertionResponse;

  factory _AuthenticatorAssertionResponse.fromJson(Map<String, dynamic> json) =
      _$_AuthenticatorAssertionResponse.fromJson;

  @override
  String get clientDataJSON;
  @override
  String get authenticatorData;
  @override
  String get signature;
  @override
  String? get userHandle;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticatorAssertionResponseCopyWith<_$_AuthenticatorAssertionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
