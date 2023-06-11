// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_key_credential_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicKeyCredentialOptions _$$_PublicKeyCredentialOptionsFromJson(
        Map<String, dynamic> json) =>
    _$_PublicKeyCredentialOptions(
      challenge: json['challenge'] as String,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      rp: json['rp'] == null
          ? null
          : RelyingParty.fromJson(json['rp'] as Map<String, dynamic>),
      pubKeyCredParams: (json['pubKeyCredParams'] as List<dynamic>?)
          ?.map((e) => PublicKeyParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      authenticatorSelection: json['authenticatorSelection'] == null
          ? null
          : AuthenticatorSelection.fromJson(
              json['authenticatorSelection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PublicKeyCredentialOptionsToJson(
        _$_PublicKeyCredentialOptions instance) =>
    <String, dynamic>{
      'challenge': instance.challenge,
      'user': instance.user?.toJson(),
      'rp': instance.rp?.toJson(),
      'pubKeyCredParams':
          instance.pubKeyCredParams?.map((e) => e.toJson()).toList(),
      'authenticatorSelection': instance.authenticatorSelection?.toJson(),
    };
