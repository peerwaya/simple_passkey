import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_passkey/models/authenticator_selection.dart';

part 'credential.g.dart';
part 'credential.freezed.dart';

@freezed
class PublicKeyCredential with _$PublicKeyCredential {
  @JsonSerializable(explicitToJson: true)
  const factory PublicKeyCredential({
    required String id,
    required String rawId,
    required AuthenticatorAssertionResponse response,
    required String type,
    AuthenticatorAttachment? authenticatorAttachment,
  }) = _PublicKeyCredentialOptions;

  factory PublicKeyCredential.fromJson(Map<String, dynamic> json) =>
      _$PublicKeyCredentialFromJson(json);
}

@freezed
class AuthenticatorAssertionResponse with _$AuthenticatorAssertionResponse {
  @JsonSerializable(explicitToJson: true)
  const factory AuthenticatorAssertionResponse({
    required String clientDataJSON,
    required String authenticatorData,
    required String signature,
    String? userHandle,
  }) = _AuthenticatorAssertionResponse;

  factory AuthenticatorAssertionResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatorAssertionResponseFromJson(json);
}
