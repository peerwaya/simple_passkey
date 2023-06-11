import 'dart:typed_data';

import 'simple_passkey_platform_interface.dart';

class SimplePasskey {
  Future<bool> isPassKeySupported() {
    return SimplePasskeyPlatform.instance.isPassKeySupported();
  }

  Future<String> createPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) {
    return SimplePasskeyPlatform.instance.createPassKey(json,
        clientDataHash: clientDataHash,
        preferImmediatelyAvailableCredentials:
            preferImmediatelyAvailableCredentials);
  }

  Future<String> getPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) {
    return SimplePasskeyPlatform.instance.getPassKey(json,
        clientDataHash: clientDataHash,
        preferImmediatelyAvailableCredentials:
            preferImmediatelyAvailableCredentials);
  }
}
