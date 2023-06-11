import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:simple_passkey/models/pass_key_exception.dart';

import 'simple_passkey_platform_interface.dart';

/// An implementation of [SimplePasskeyPlatform] that uses method channels.
class MethodChannelSimplePasskey extends SimplePasskeyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('simple_passkey');

  @override
  Future<bool> isPassKeySupported() async {
    final supported = await methodChannel.invokeMethod<bool>('isSupported');
    return supported ?? false;
  }

  @override
  Future<String> createPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) async {
    try {
      final response =
          await methodChannel.invokeMethod<String>('createPassKey', {
        json: json,
        clientDataHash: clientDataHash,
        preferImmediatelyAvailableCredentials:
            preferImmediatelyAvailableCredentials
      });
      return response!;
    } on PlatformException catch (error) {
      throw PassKeyException.fromString(error.code, message: error.message);
    } catch (error) {
      throw PassKeyException(ErrorCode.unknown, message: error.toString());
    }
  }

  @override
  Future<String> getPassKey(String json,
      {Uint8List? clientDataHash,
      bool preferImmediatelyAvailableCredentials = true}) async {
    try {
      final response = await methodChannel.invokeMethod<String>('getPassKey', {
        json: json,
        clientDataHash: clientDataHash,
        preferImmediatelyAvailableCredentials:
            preferImmediatelyAvailableCredentials
      });
      return response!;
    } on PlatformException catch (error) {
      throw PassKeyException.fromString(error.code, message: error.message);
    } catch (error) {
      throw PassKeyException(ErrorCode.unknown, message: error.toString());
    }
  }
}
