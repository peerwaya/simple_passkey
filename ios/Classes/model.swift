//
//  model.swift
//  simple_passkey
//
//  Created by Onyemaechi Okafor on 6/10/23.
//

struct PublicKeyCredentialCreationOptions: Codable {
    let rp: PublicKeyCredentialRpEntity
    let user: PublicKeyCredentialUserEntity
    let challenge: String
    let pubKeyCredParams: [PublicKeyCredentialParameters]
    let timeout: Int?
    let excludeCredentials: [PublicKeyCredentialDescriptor]?
    let authenticatorSelection: AuthenticatorSelectionCriteria?
    let attestation: AttestationConveyancePreference?
}

struct PublicKeyCredentialRpEntity: Codable {
    let id: String
    let name: String
    let icon: String?
}

struct PublicKeyCredentialUserEntity: Codable {
    let id: String
    let name: String
    let displayName: String
    let icon: String?
}

struct PublicKeyCredentialParameters: Codable {
    let type: String
    let alg: Int
}

struct AuthenticatorSelectionCriteria: Codable {
    let authenticatorAttachment: AuthenticatorAttachment?
    let requireResidentKey: Bool?
    let userVerification: UserVerificationRequirement?
}

enum AuthenticatorAttachment: String, Codable {
    case platform = "platform"
    case crossPlatform = "cross-platform"
}

enum AttestationConveyancePreference: String, Codable {
    case none = "none"
    case indirect = "indirect"
    case direct = "direct"
    case enterprise = "enterprise"
}

typealias Base64URLString = String

struct RegistrationResponseJSON: Codable {
    let id: Base64URLString
    let rawId: Base64URLString
    let response: AuthenticatorAttestationResponseJSON
    let authenticatorAttachment: String?
    let clientExtensionResults: AuthenticationExtensionsClientOutputsJSON
    let type: String
}

struct AuthenticatorAttestationResponseJSON: Codable {
    let clientDataJSON: Base64URLString
    let attestationObject: Base64URLString
    let transports: [String]
}

struct AuthenticationResponseJSON: Codable {
    let id: Base64URLString
    let rawId: Base64URLString
    let response: AuthenticatorAssertionResponseJSON
    let authenticatorAttachment: String?
    let clientExtensionResults: AuthenticationExtensionsClientOutputsJSON
    let type: String
}

struct AuthenticatorAssertionResponseJSON: Codable {
    let clientDataJSON: Base64URLString
    let authenticatorData: Base64URLString?
    let signature: Base64URLString
    let userHandle: Base64URLString?
}

struct AuthenticationExtensionsClientOutputsJSON: Codable {
    // No properties defined in the interface
}

struct PublicKeyCredentialRequestOptions: Codable {
    let challenge: String
    let timeout: Int?
    let rpId: String?
    let allowCredentials: [PublicKeyCredentialDescriptor]?
    let userVerification: UserVerificationRequirement?
}

struct PublicKeyCredentialDescriptor: Codable {
    let type: PublicKeyCredentialType
    let id: String
    let transports: [AuthenticatorTransport]?
}

enum PublicKeyCredentialType: String, Codable {
    case publicKey = "public-key"
}

enum AuthenticatorTransport: String, Codable {
    case usb
    case nfc
    case ble
    case internalTransport = "internal"
}

enum UserVerificationRequirement: String, Codable {
    case required = "required"
    case preferred = "preferred"
    case discouraged = "discouraged"
}
// You can use a library like 'AnyCodable' for dynamic extension inputs
