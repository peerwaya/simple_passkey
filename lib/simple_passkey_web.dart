// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

// import 'dart:html' as html;
// import 'dart:js_interop';
// import 'dart:typed_data';

import 'dart:typed_data';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'simple_passkey_platform_interface.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;

// @JS('window.PublicKeyCredential')
// external PublicKeyCredential? get publicKeyCredential;

// @JS('navigator.credentials.create')
// external PubKeyCredentialJs createCredential(CreateOptionsJs options);

@JS('SimpleWebAuthnBrowser.startRegistration')
external Future<Object> startRegistration(Object obj);

@JS('SimpleWebAuthnBrowser.startAuthentication')
external Future<Object> startAuthentication(Object obj);

@JS('SimpleWebAuthnBrowser.browserSupportsWebAuthn')
external bool browserSupportsWebAuthn();

@JS('JSON.stringify')
external String stringify(Object obj);

@JS('JSON.parse')
external String parse(String obj);

// @JS()
// @anonymous
// class CreateOptionsJs {
//   external PublicKeyCredentialCreationOptionsJS publicKey;
//   external factory CreateOptionsJs(
//       {PublicKeyCredentialCreationOptionsJS? publicKey});
// }

// @JS()
// @anonymous
// class PublicKeyCredential {
//   external Future<bool> isUserVerifyingPlatformAuthenticatorAvailable();
//   external Future<bool> isConditionalMediationAvailable();
// }

// @JS()
// @anonymous
// class PublicKeyCredentialCreationOptionsJS {
//   external Uint8List challenge;
//   external UserJS user;
//   external RelyingPartyJs rp;
//   external List<PubKeyCredParam> pubKeyCredParams;
//   external AuthenticatorSelectionJs authenticatorSelection;
//   external factory PublicKeyCredentialCreationOptionsJS({
//     Uint8List? challenge,
//     UserJS? user,
//     RelyingPartyJs? rp,
//     List<PubKeyCredParam>? pubKeyCredParams,
//     AuthenticatorSelectionJs? authenticatorSelection,
//   });
// }

// @JS()
// @anonymous
// class UserJS {
//   external Uint8List id;
//   external String name;
//   external String displayName;
//   external factory UserJS({Uint8List? id, String? name, String? displayName});
// }

// @JS()
// @anonymous
// class RelyingPartyJs {
//   external String name;
//   external String id;
//   external factory RelyingPartyJs({String? id, String? name});
// }

// @JS()
// @anonymous
// class PubKeyCredParam {
//   external int alg;
//   external String type;
//   external factory PubKeyCredParam({int? alg, String? type});
// }

// @JS()
// @anonymous
// class CredentialJs {
//   external Uint8List id;
//   external String type;
//   external List<String> transports;
//   external factory CredentialJs(
//       {Uint8List? id, String? type, List<String>? transports});
// }

// @JS()
// @anonymous
// class AuthenticatorSelectionJs {
//   external String requireResidentKey;
//   external String authenticatorAttachment;
//   external String userVerification;
//   external factory AuthenticatorSelectionJs(
//       {String? requireResidentKey,
//       String? authenticatorAttachment,
//       String? userVerification});
// }

// @JS()
// @anonymous
// class PubKeyCredentialJs {
//   external String id;
//   external Uint8List rawId;
//   external PubKeyResponseJs response;
//   external String authenticatorAttachment;
//   external String? getClientExtensionResults();
// }

// @JS()
// @anonymous
// class PubKeyResponseJs {
//   external Uint8List clientDataJson;
//   external Uint8List attestationObject;
//   external Uint8List signature;
//   external Uint8List? userHandle;
//   external factory PubKeyResponseJs(
//       {Uint8List? clientDataJson,
//       Uint8List? attestationObject,
//       Uint8List? signature,
//       Uint8List? userHandle});
// }

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
    final response =
        await js_util.promiseToFuture(startRegistration(parse(json)));
    return stringify(response);
  }

  @override
  Future<String> getPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) async {
    final response =
        await js_util.promiseToFuture(startAuthentication(parse(json)));
    return stringify(response);
  }
}
