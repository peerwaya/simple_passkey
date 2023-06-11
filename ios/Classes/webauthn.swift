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

@available(iOS 15.0, *)
public class WebAuthn: NSObject, ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    
    var isPerformingModalReqest = false;
    
    var result: FlutterResult?;

    
    public func createPassKey(json: String, preferImmediatelyAvailableCredentials: Bool, result: @escaping FlutterResult) {
        if let jsonData = json.data(using: .utf8) {
            do {
                self.result = result;
                let decoder = JSONDecoder()
                let options = try decoder.decode(PublicKeyCredentialCreationOptions.self, from: jsonData);
                guard let challenge = Data(base64Encoded: options.challenge) else {
                    result(FlutterError(
                        code: "invalid_argument",
                        message: "challenge: \(options.challenge)", details: nil));
                    return;
                };
                guard let userId = Data(base64Encoded: options.user.id) else {
                    result(FlutterError(
                        code: "invalid_argument",
                        message: "userId: \(options.user.id)", details: nil));
                    return;
                };
                let publicKeyCredentialProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: options.rp.id)
                let registrationRequest = publicKeyCredentialProvider.createCredentialRegistrationRequest(challenge: challenge,                                   name: options.user.displayName, userID: userId)
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
        }
    }
    
    public func getPassKey(json: String, preferImmediatelyAvailableCredentials: Bool, result: @escaping FlutterResult) {
        if let jsonData = json.data(using: .utf8) {
            do {
                self.result = result;
                let decoder = JSONDecoder()
                let options = try decoder.decode(PublicKeyCredentialRequestOptions.self, from: jsonData);
                guard let challenge = Data(base64Encoded: options.challenge) else {
                    result(FlutterError(
                        code: "invalid_argument",
                        message: "challenge: \(options.challenge)", details: nil));
                    return;
                };
                let publicKeyCredentialProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: options.rpId ?? "")
                let assertionRequest = publicKeyCredentialProvider.createCredentialAssertionRequest(challenge: challenge)
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
                print("Error decoding JSON: \(error)")
                result(FlutterError(
                    code: "invalid_argument",
                    message: "\(error)", details: nil));
                self.result = nil;
            }
        }
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        let logger = Logger()
        let encoder = JSONEncoder()
        if (self.result == nil) {
            return;
        }
        do {
            switch authorization.credential {
            case let credentialRegistration as ASAuthorizationPlatformPublicKeyCredentialRegistration:
                logger.log("A new passkey was registered: \(credentialRegistration)")
                // Verify the attestationObject and clientDataJSON with your service.
                // The attestationObject contains the user's new public key to store and use for subsequent sign-ins.
                let attestationObject = credentialRegistration.rawAttestationObject
                let clientDataJSON = credentialRegistration.rawClientDataJSON
                let registrationResponse = RegistrationResponseJSON(
                    id: credentialRegistration.credentialID.base64EncodedString(),
                    rawId: credentialRegistration.credentialID.base64EncodedString(),
                    response: AuthenticatorAttestationResponseJSON(
                        clientDataJSON: clientDataJSON.base64EncodedString(),
                        attestationObject: attestationObject!.base64EncodedString(),
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
                    id: credentialAssertion.credentialID.base64EncodedString(),
                    rawId: credentialAssertion.credentialID.base64EncodedString(),
                    response: AuthenticatorAssertionResponseJSON(
                        clientDataJSON: clientDataJSON.base64EncodedString(),
                        authenticatorData: authenticatorData!.base64EncodedString(),
                        signature: credentialAssertion.signature.base64EncodedString(),
                        userHandle: credentialAssertion.userID.base64EncodedString()
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
        } catch {
            self.result!(FlutterError(
                code: "invalid_argument",
                message: "\(error)", details: nil));
        }
        isPerformingModalReqest = false
        self.result = nil;
    }
    
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        let logger = Logger()
        if (self.result == nil) {
            return;
        }
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
        
        self.result = nil;
        isPerformingModalReqest = false
    }

    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first!
    }
}
