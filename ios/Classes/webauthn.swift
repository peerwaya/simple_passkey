//
//  webauthn.swift
//  simple_passkey
//
//  Created by Onyemaechi Okafor on 6/10/23.
//

import Foundation

import Flutter
import UIKit
import AuthenticationServices
import os

class WebAuthn: NSObject, ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    
    var isPerformingModalReqest = false;
    
    var result: FlutterResult?;

    
    @available(iOS 15.0, *)
    func createPassKey(json: String, preferImmediatelyAvailableCredentials: Bool, result: @escaping FlutterResult) {
        let logger = Logger()
        if let jsonData = json.data(using: .utf8) {
            do {
                self.result = result;
                let decoder = JSONDecoder()
                let options = try decoder.decode(PublicKeyCredentialCreationOptions.self, from: jsonData);
                guard let challenge = base64URLToData(options.challenge) else {
                    result(FlutterError(
                        code: "invalid_argument",
                        message: "challenge: \(options.challenge)", details: nil));
                    return;
                };
                guard let userId = base64URLToData(options.user.id) else {
                    result(FlutterError(
                        code: "invalid_argument",
                        message: "userId: \(options.user.id)", details: nil));
                    return;
                };
                let publicKeyCredentialProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: options.rp.id)
                let registrationRequest = publicKeyCredentialProvider.createCredentialRegistrationRequest(challenge: challenge,                                   name: options.user.name, userID: userId)
                if let attestation = options.attestation {
                    registrationRequest.attestationPreference = ASAuthorizationPublicKeyCredentialAttestationKind.init(rawValue: attestation.rawValue)
                }
                if let userVerification = options.authenticatorSelection?.userVerification {
                    registrationRequest.userVerificationPreference = ASAuthorizationPublicKeyCredentialUserVerificationPreference.init(rawValue: userVerification.rawValue)
                }
                let authController = ASAuthorizationController(authorizationRequests: [ registrationRequest ] )
                authController.delegate = self
                authController.presentationContextProvider = self
                if preferImmediatelyAvailableCredentials, #available(iOS 16.0, *) {
                    // If credentials are available, presents a modal sign-in sheet.
                    // If there are no locally saved credentials, no UI appears and
                    // the system passes ASAuthorizationError.Code.canceled to call
                    // `AccountManager.authorizationController(controller:didCompleteWithError:)`.
                    authController.performRequests(options: .preferImmediatelyAvailableCredentials)
                } else {
                    // If credentials are available, presents a modal sign-in sheet.
                    // If there are no locally saved credentials, the system presents a QR code to allow signing in with a
                    // passkey from a nearby device.
                    authController.performRequests()
                }
                isPerformingModalReqest = true
            } catch {
                print("Error decoding JSON: \(error)")
                result(FlutterError(
                    code: "invalid_argument",
                    message: "\(error)", details: nil));
                self.result = nil;
            }
        } else {
            result(FlutterError(
                code: "invalid_argument",
                message: "failed to convert to data \(json)", details: nil));
            self.result = nil;
        }
    }
    
    @available(iOS 15.0, *)
    func getPassKey(json: String, preferImmediatelyAvailableCredentials: Bool, result: @escaping FlutterResult) {
        let logger = Logger()
        logger.log("getPassKey: \(json)")
        if let jsonData = json.data(using: .utf8) {
            do {
                self.result = result;
                let decoder = JSONDecoder()
                let options = try decoder.decode(PublicKeyCredentialRequestOptions.self, from: jsonData);
                guard let challenge = base64URLToData(options.challenge) else {
                    result(FlutterError(
                        code: "invalid_argument",
                        message: "challenge: \(options.challenge)", details: nil));
                    return;
                };
                let publicKeyCredentialProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: options.rpId ?? "")
                let assertionRequest = publicKeyCredentialProvider.createCredentialAssertionRequest(challenge: challenge)
                
                if let allowedCredentials = options.allowCredentials?.map({ credentialDescriptor in
                    ASAuthorizationPlatformPublicKeyCredentialDescriptor.init(credentialID: base64URLToData(credentialDescriptor.id) ?? Data())
                }) {
                    assertionRequest.allowedCredentials = allowedCredentials;
                }
                if let userVerification = options.userVerification {
                    assertionRequest.userVerificationPreference = ASAuthorizationPublicKeyCredentialUserVerificationPreference.init(rawValue: userVerification.rawValue)
                }
                let authController = ASAuthorizationController(authorizationRequests: [ assertionRequest ] )
                authController.delegate = self
                authController.presentationContextProvider = self
                if preferImmediatelyAvailableCredentials, #available(iOS 16.0, *) {
                    // If credentials are available, presents a modal sign-in sheet.
                    // If there are no locally saved credentials, no UI appears and
                    // the system passes ASAuthorizationError.Code.canceled to call
                    // `AccountManager.authorizationController(controller:didCompleteWithError:)`.
                    authController.performRequests(options: .preferImmediatelyAvailableCredentials)
                } else {
                    // If credentials are available, presents a modal sign-in sheet.
                    // If there are no locally saved credentials, the system presents a QR code to allow signing in with a
                    // passkey from a nearby device.
                    authController.performRequests()
                }
                isPerformingModalReqest = true
            } catch {
                result(FlutterError(
                    code: "invalid_argument",
                    message: "\(error)", details: nil));
                self.result = nil;
            }
        } else {
            result(FlutterError(
                code: "invalid_argument",
                message: "failed to convert to data \(json)", details: nil));
            self.result = nil;
        }
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        do {
            if #available(iOS 15.0, *) {
                let logger = Logger()
                let encoder = JSONEncoder()
                if (self.result == nil) {
                    return;
                }
                switch authorization.credential {
                case let credentialRegistration as ASAuthorizationPlatformPublicKeyCredentialRegistration:
                    logger.log("A new passkey was registered: \(credentialRegistration)")
                    // Verify the attestationObject and clientDataJSON with your service.
                    // The attestationObject contains the user's new public key to store and use for subsequent sign-ins.
                    let attestationObject = credentialRegistration.rawAttestationObject
                    let clientDataJSON = credentialRegistration.rawClientDataJSON
                    let registrationResponse = RegistrationResponseJSON(
                        id: base64URLEncode(credentialRegistration.credentialID),
                        rawId: base64URLEncode(credentialRegistration.credentialID),
                        response: AuthenticatorAttestationResponseJSON(
                            clientDataJSON: base64URLEncode(clientDataJSON),
                            attestationObject: base64URLEncode(attestationObject!),
                            transports: []
                        ),
                        authenticatorAttachment: nil,
                        clientExtensionResults: AuthenticationExtensionsClientOutputsJSON(),
                        type: "public-key"
                    );
                    // After the server verifies the registration and creates the user account, sign in the user with the new account.
                    encoder.outputFormatting = .prettyPrinted
                    let jsonData = try encoder.encode(registrationResponse)
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        self.result!(jsonString);
                    } else {
                        self.result!(FlutterError(
                            code: "credential_dom_exception",
                            message: "invalid json data \(jsonData)", details: nil));
                    }
                case let credentialAssertion as ASAuthorizationPlatformPublicKeyCredentialAssertion:
                    logger.log("A passkey was used to sign in: \(credentialAssertion)")
                    // Verify the below signature and clientDataJSON with your service for the given userID.
                    // let signature = credentialAssertion.signature
                    // let clientDataJSON = credentialAssertion.rawClientDataJSON
                    // let userID = credentialAssertion.userID
                    
                    let authenticatorData = credentialAssertion.rawAuthenticatorData;
                    let clientDataJSON = credentialAssertion.rawClientDataJSON
                    let authenticationResponse = AuthenticationResponseJSON(
                        id: base64URLEncode(credentialAssertion.credentialID),
                        rawId: base64URLEncode(credentialAssertion.credentialID),
                        response: AuthenticatorAssertionResponseJSON(
                            clientDataJSON: base64URLEncode(clientDataJSON),
                            authenticatorData: authenticatorData != nil ? base64URLEncode(authenticatorData!) : nil,
                            signature: base64URLEncode(credentialAssertion.signature),
                            userHandle: base64URLEncode(credentialAssertion.userID)
                        ),
                        authenticatorAttachment: nil,
                        clientExtensionResults: AuthenticationExtensionsClientOutputsJSON(),
                        type: "public-key"
                    );
                    // After the server verifies the registration and creates the user account, sign in the user with the new account.
                    encoder.outputFormatting = .prettyPrinted
                    let jsonData = try encoder.encode(authenticationResponse)
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        self.result!(jsonString);
                    } else {
                        self.result!(FlutterError(
                            code: "credential_dom_exception",
                            message: "invalid json data \(jsonData)", details: nil));
                    }
                default:
                    self.result!(FlutterError(
                        code: "invalid_credential_type",
                        message: "Received unknown authorization type.", details: nil));
                }
            } else {
                self.result!(FlutterError(
                    code: "invalid_argument",
                    message: "unsupported version", details: nil));
            }
        } catch {
            self.result!(FlutterError(
                code: "invalid_argument",
                message: "\(error)", details: nil));
        }
        isPerformingModalReqest = false
        self.result = nil;
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if #available(iOS 15.0, *) {
            let logger = Logger()
            logger.log("Start Error.")
            guard let authorizationError = error as? ASAuthorizationError else {
                isPerformingModalReqest = false
                logger.error("Unexpected authorization error: \(error.localizedDescription)")
                self.result!(FlutterError(
                    code: "unknown",
                    message: "\(error)", details: nil));
                return
            }
            if authorizationError.code == .canceled {
                // Either the system doesn't find any credentials and the request ends silently, or the user cancels the request.
                // This is a good time to show a traditional login form, or ask the user to create an account.
                logger.log("Request canceled.")
                if isPerformingModalReqest {
                    self.result!(FlutterError(
                        code: "user_canceled",
                        message: "\(error)", details: nil));
                } else {
                    self.result!(FlutterError(
                        code: "platform_canceled",
                        message: "\(error)", details: nil));
                }
            } else {
                // Another ASAuthorization error.
                // Note: The userInfo dictionary contains useful information.
                logger.error("Error: \((error as NSError).userInfo)")
                self.result!(FlutterError(
                    code: "unknown",
                    message: "\(error)", details: nil));
            }
        } else {
            self.result!(FlutterError(
                code: "unknown",
                message: "unsupported version", details: nil));
        }
        self.result = nil;
        isPerformingModalReqest = false
    }

    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first!
    }
    
    func base64URLEncode(_ data: Data) -> String {
        let base64 = data.base64EncodedString()
        let base64URL = base64
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
        
        return base64URL
    }
    
    func base64URLToData(_ base64URLString: String) -> Data? {
        var base64 = base64URLString
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        // Add padding characters if necessary
        let paddingLength = 4 - (base64.count % 4)
        if paddingLength < 4 {
            base64.append(String(repeating: "=", count: paddingLength))
        }
        
        return Data(base64Encoded: base64)
    }
}
