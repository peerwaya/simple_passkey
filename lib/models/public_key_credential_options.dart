import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_passkey/models/authenticator_selection.dart';
import 'package:simple_passkey/models/public_key_param.dart';
import 'package:simple_passkey/models/relying_party.dart';
import 'package:simple_passkey/models/user.dart';

part 'public_key_credential_options.g.dart';
part 'public_key_credential_options.freezed.dart';

@freezed
class PublicKeyCredentialOptions with _$PublicKeyCredentialOptions {
  @JsonSerializable(explicitToJson: true)
  const factory PublicKeyCredentialOptions({
    required String challenge,
    User? user,
    RelyingParty? rp,
    List<PublicKeyParam>? pubKeyCredParams,
    AuthenticatorSelection? authenticatorSelection,
  }) = _PublicKeyCredentialOptions;

  factory PublicKeyCredentialOptions.fromJson(Map<String, dynamic> json) =>
      _$PublicKeyCredentialOptionsFromJson(json);
}
