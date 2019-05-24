//
//  BiometricAuthenticator.swift
//  Nerde Yesem
//
//  Created by Batuhan Göbekli on 24.05.2019.
//  Copyright © 2019 Batuhan Göbekli. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

let kBiometryNotAvailableReason = "Biometric authentication is not available for this device."

/// ****************  Touch ID  ****************** ///
let kTouchIdAuthenticationReason = "Confirm your fingerprint to authenticate."
let kTouchIdPasscodeAuthenticationReason = "Touch ID is locked now, because of too many failed attempts. Enter passcode to unlock Touch ID."

/// Error Messages Touch ID
let kSetPasscodeToUseTouchID = "Please set device passcode to use Touch ID for authentication."
let kNoFingerprintEnrolled = "There are no fingerprints enrolled in the device. Please go to Device Settings -> Touch ID & Passcode and enroll your fingerprints."
let kDefaultTouchIDAuthenticationFailedReason = "Touch ID does not recognize your fingerprint. Please try again with your enrolled fingerprint."

/// ****************  Face ID  ****************** ///
let kFaceIdAuthenticationReason = "Confirm your face to authenticate."
let kFaceIdPasscodeAuthenticationReason = "Face ID is locked now, because of too many failed attempts. Enter passcode to unlock Face ID."

/// Error Messages Face ID
let kSetPasscodeToUseFaceID = "Please set device passcode to use Face ID for authentication."
let kNoFaceIdentityEnrolled = "There is no face enrolled in the device. Please go to Device Settings -> Face ID & Passcode and enroll your face."
let kDefaultFaceIDAuthenticationFailedReason = "Face ID does not recognize your face. Please try again with your enrolled face."

open class BioMetricAuthenticator: NSObject {
    
    // MARK: - Singleton
    public static let shared = BioMetricAuthenticator()
    
    // MARK: - Private
    private override init() {}
    private lazy var context: LAContext? = {
        return LAContext()
    }()
    
    // MARK: - Public
    public var allowableReuseDuration: TimeInterval? = nil {
        didSet {
            guard let duration = allowableReuseDuration else {
                return
            }
            if #available(iOS 9.0, *) {
                self.context?.touchIDAuthenticationAllowableReuseDuration = duration
            }
        }
    }
}

// MARK:- Public
public extension BioMetricAuthenticator {
    
    /// checks if biometric authentication can be performed currently on the device.
    class func canAuthenticate() -> Bool {
        
        var isBiometricAuthenticationAvailable = false
        var error: NSError? = nil
        
        if LAContext().canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            isBiometricAuthenticationAvailable = (error == nil)
        }
        return isBiometricAuthenticationAvailable
    }
    
    /// Check for biometric authentication
    class func authenticateWithBioMetrics(reason: String, fallbackTitle: String? = "", cancelTitle: String? = "", completion: @escaping (Result<Bool, AuthenticationError>) -> Void) {
        
        // reason
        let reasonString = reason.isEmpty ? BioMetricAuthenticator.shared.defaultBiometricAuthenticationReason() : reason
        
        // context
        var context: LAContext!
        if BioMetricAuthenticator.shared.isReuseDurationSet() {
            context = BioMetricAuthenticator.shared.context
        }else {
            context = LAContext()
        }
        context.localizedFallbackTitle = fallbackTitle
        
        // cancel button title
        if #available(iOS 10.0, *) {
            context.localizedCancelTitle = cancelTitle
        }
        
        // authenticate
        BioMetricAuthenticator.shared.evaluate(policy: .deviceOwnerAuthenticationWithBiometrics, with: context, reason: reasonString, completion: completion)
    }
    
    /// Check for device passcode authentication
    class func authenticateWithPasscode(reason: String, cancelTitle: String? = "", completion: @escaping (Result<Bool, AuthenticationError>) -> ()) {
        
        // reason
        let reasonString = reason.isEmpty ? BioMetricAuthenticator.shared.defaultPasscodeAuthenticationReason() : reason
        
        let context = LAContext()
        
        // cancel button title
        if #available(iOS 10.0, *) {
            context.localizedCancelTitle = cancelTitle
        }
        
        // authenticate
        if #available(iOS 9.0, *) {
            BioMetricAuthenticator.shared.evaluate(policy: .deviceOwnerAuthentication, with: context, reason: reasonString, completion: completion)
        } else {
            // Fallback on earlier versions
            BioMetricAuthenticator.shared.evaluate(policy: .deviceOwnerAuthenticationWithBiometrics, with: context, reason: reasonString, completion: completion)
        }
    }
    
    /// checks if device supports face id authentication
    func faceIDAvailable() -> Bool {
        if #available(iOS 11.0, *) {
            let context = LAContext()
            return (context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: nil) && context.biometryType == .faceID)
        }
        return false
    }
    
    /// checks if device supports touch id authentication
    func touchIDAvailable() -> Bool {
        let context = LAContext()
        var error: NSError?
        
        let canEvaluate = context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error)
        if #available(iOS 11.0, *) {
            return canEvaluate && context.biometryType == .touchID
        }
        return canEvaluate
    }
}

// MARK:- Private
extension BioMetricAuthenticator {
    
    /// get authentication reason to show while authentication
    private func defaultBiometricAuthenticationReason() -> String {
        return faceIDAvailable() ? kFaceIdAuthenticationReason : kTouchIdAuthenticationReason
    }
    
    /// get passcode authentication reason to show while entering device passcode after multiple failed attempts.
    private func defaultPasscodeAuthenticationReason() -> String {
        return faceIDAvailable() ? kFaceIdPasscodeAuthenticationReason : kTouchIdPasscodeAuthenticationReason
    }
    
    /// checks if allowableReuseDuration is set
    private func isReuseDurationSet() -> Bool {
        guard allowableReuseDuration != nil else {
            return false
        }
        return true
    }
    
    /// evaluate policy
    private func evaluate(policy: LAPolicy, with context: LAContext, reason: String, completion: @escaping (Result<Bool, AuthenticationError>) -> ()) {
        
        context.evaluatePolicy(policy, localizedReason: reason) { (success, err) in
            DispatchQueue.main.async {
                if success {
                    completion(.success(true))
                }else {
                    let errorType = AuthenticationError.initWithError(err as! LAError)
                    completion(.failure(errorType))
                }
            }
        }
    }
}
