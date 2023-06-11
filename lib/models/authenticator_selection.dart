import 'package:freezed_annotation/freezed_annotation.dart';

part 'authenticator_selection.g.dart';
part 'authenticator_selection.freezed.dart';

enum AuthenticatorTransportFuture {
  ble("ble"),
  internal("internal"),
  nfc("nfc"),
  usb("usb"),
  cable("cable"),
  hybrid("hybrid");

  final String name;

  const AuthenticatorTransportFuture(this.name);

  @override
  String toString() {
    return name;
  }
}

enum AuthenticatorAttachment {
  platform("platform"),
  @JsonValue("cross-platform")
  crossPlatform("cross-platform");

  final String name;

  const AuthenticatorAttachment(this.name);

  @override
  String toString() {
    return name;
  }
}

enum AuthenticatorUserVerification {
  required("required"),
  discouraged("discouraged"),
  preferred("preferred");

  final String name;

  const AuthenticatorUserVerification(this.name);

  @override
  String toString() {
    return name;
  }
}

@freezed
class AuthenticatorSelection with _$AuthenticatorSelection {
  @JsonSerializable(explicitToJson: true)
  const factory AuthenticatorSelection({
    @Default(AuthenticatorAttachment.platform)
    AuthenticatorAttachment? authenticatorAttachment,
    @Default(AuthenticatorUserVerification.preferred)
    AuthenticatorUserVerification? userVerification,
    bool? requireResidentKey,
  }) = _AuthenticatorSelection;

  factory AuthenticatorSelection.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatorSelectionFromJson(json);
}
