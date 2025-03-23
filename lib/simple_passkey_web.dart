@JS('SimpleWebAuthnBrowser')
library;

import 'dart:typed_data';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'simple_passkey_platform_interface.dart';
import 'dart:js_interop';

@JS()
external JSPromise<JSAny> startRegistration(JSAny obj);

@JS()
external JSPromise<JSAny> startAuthentication(JSAny obj);

@JS()
external bool browserSupportsWebAuthn();

@JS('JSON.stringify')
external JSString stringify(JSAny obj);

@JS('JSON.parse')
external JSObject parse(JSString obj);

/// A web implementation of the SimplePasskeyPlatform of the SimplePasskey plugin.
class SimplePasskeyWeb extends SimplePasskeyPlatform {
  /// Constructs a SimplePasskeyWeb
  SimplePasskeyWeb();

  static void registerWith(Registrar registrar) {
    SimplePasskeyPlatform.instance = SimplePasskeyWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<bool> isPassKeySupported() async {
    try {
      return browserSupportsWebAuthn();
    } catch (error) {
      return false;
    }
  }

  @override
  Future<String> createPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) async {
    return startRegistration(parse(json.toJS))
        .toDart
        .then((value) => stringify(value).toDart);
  }

  @override
  Future<String> getPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) async {
    return startAuthentication(parse(json.toJS))
        .toDart
        .then((value) => stringify(value).toDart);
  }
}
