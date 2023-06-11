// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticator_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthenticatorSelection _$$_AuthenticatorSelectionFromJson(
        Map<String, dynamic> json) =>
    _$_AuthenticatorSelection(
      authenticatorAttachment: $enumDecodeNullable(
              _$AuthenticatorAttachmentEnumMap,
              json['authenticatorAttachment']) ??
          AuthenticatorAttachment.platform,
      userVerification: $enumDecodeNullable(
              _$AuthenticatorUserVerificationEnumMap,
              json['userVerification']) ??
          AuthenticatorUserVerification.preferred,
      requireResidentKey: json['requireResidentKey'] as bool?,
    );

Map<String, dynamic> _$$_AuthenticatorSelectionToJson(
        _$_AuthenticatorSelection instance) =>
    <String, dynamic>{
      'authenticatorAttachment':
          _$AuthenticatorAttachmentEnumMap[instance.authenticatorAttachment],
      'userVerification':
          _$AuthenticatorUserVerificationEnumMap[instance.userVerification],
      'requireResidentKey': instance.requireResidentKey,
    };

const _$AuthenticatorAttachmentEnumMap = {
  AuthenticatorAttachment.platform: 'platform',
  AuthenticatorAttachment.crossPlatform: 'cross-platform',
};

const _$AuthenticatorUserVerificationEnumMap = {
  AuthenticatorUserVerification.required: 'required',
  AuthenticatorUserVerification.discouraged: 'discouraged',
  AuthenticatorUserVerification.preferred: 'preferred',
};
