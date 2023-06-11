import Flutter
import UIKit
import AuthenticationServices

public class SimplePasskeyPlugin: NSObject, FlutterPlugin {
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "simple_passkey", binaryMessenger: registrar.messenger())
        let instance = SimplePasskeyPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "isSupported":
            if #available(iOS 15.0, *) {
                result(true);
            } else {
                result(false);
            }
        case "createPassKey":
            if #available(iOS 15.0, *) {
                let args = call.arguments as! Dictionary<String, Any>;
                let jsonString : String  =  args["json"]! as! String;
                let preferImmediatelyAvailableCredentials : Bool?  =  args["preferImmediatelyAvailableCredentials"] as? Bool;
                let webAuthn = WebAuthn();
                webAuthn.createPassKey(json: jsonString, preferImmediatelyAvailableCredentials: preferImmediatelyAvailableCredentials ?? false, result: result)
            } else {
                result(FlutterError(
                    code: "unsupported",
                    message: "Platform unasupported", details: nil));
            }
        case "getPassKey":
            if #available(iOS 15.0, *) {
                let args = call.arguments as! Dictionary<String, Any>;
                let jsonString : String  =  args["json"]! as! String;
                let preferImmediatelyAvailableCredentials : Bool?  =  args["preferImmediatelyAvailableCredentials"] as? Bool;
                let webAuthn = WebAuthn();
                webAuthn.getPassKey(json: jsonString, preferImmediatelyAvailableCredentials: preferImmediatelyAvailableCredentials ?? false, result: result)
            } else {
                result(FlutterError(
                    code: "unsupported",
                    message: "Platform unasupported", details: nil));
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
