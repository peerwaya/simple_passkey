// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicKeyCredentialOptions _$$_PublicKeyCredentialOptionsFromJson(
        Map<String, dynamic> json) =>
    _$_PublicKeyCredentialOptions(
      id: json['id'] as String,
      rawId: json['rawId'] as String,
      response: AuthenticatorAssertionResponse.fromJson(
          json['response'] as Map<String, dynamic>),
      type: json['type'] as String,
      authenticatorAttachment: $enumDecodeNullable(
          _$AuthenticatorAttachmentEnumMap, json['authenticatorAttachment']),
    );

Map<String, dynamic> _$$_PublicKeyCredentialOptionsToJson(
        _$_PublicKeyCredentialOptions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'response': instance.response.toJson(),
      'type': instance.type,
      'authenticatorAttachment':
          _$AuthenticatorAttachmentEnumMap[instance.authenticatorAttachment],
    };

const _$AuthenticatorAttachmentEnumMap = {
  AuthenticatorAttachment.platform: 'platform',
  AuthenticatorAttachment.crossPlatform: 'cross-platform',
};

_$_AuthenticatorAssertionResponse _$$_AuthenticatorAssertionResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AuthenticatorAssertionResponse(
      clientDataJSON: json['clientDataJSON'] as String,
      authenticatorData: json['authenticatorData'] as String,
      signature: json['signature'] as String,
      userHandle: json['userHandle'] as String?,
    );

Map<String, dynamic> _$$_AuthenticatorAssertionResponseToJson(
        _$_AuthenticatorAssertionResponse instance) =>
    <String, dynamic>{
      'clientDataJSON': instance.clientDataJSON,
      'authenticatorData': instance.authenticatorData,
      'signature': instance.signature,
      'userHandle': instance.userHandle,
    };
