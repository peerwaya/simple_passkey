import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'simple_passkey_method_channel.dart';

abstract class SimplePasskeyPlatform extends PlatformInterface {
  /// Constructs a SimplePasskeyPlatform.
  SimplePasskeyPlatform() : super(token: _token);

  static final Object _token = Object();

  static SimplePasskeyPlatform _instance = MethodChannelSimplePasskey();

  /// The default instance of [SimplePasskeyPlatform] to use.
  ///
  /// Defaults to [MethodChannelSimplePasskey].
  static SimplePasskeyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SimplePasskeyPlatform] when
  /// they register themselves.
  static set instance(SimplePasskeyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isPassKeySupported() {
    throw UnimplementedError('isPassKeySupported() has not been implemented.');
  }

  Future<String> createPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) {
    throw UnimplementedError('createPassKey() has not been implemented.');
  }

  Future<String> getPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) {
    throw UnimplementedError('createPassKey() has not been implemented.');
  }
}
