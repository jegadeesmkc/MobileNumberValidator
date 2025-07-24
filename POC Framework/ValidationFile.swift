//
//  ValidationFile.swift
//  POC Framework
//
//  Created by Jegadeeswaran on 24/07/25.
//

import Foundation

public class MobileValidator {

    public init() {}

    public func validate(mobile: String?) -> ValidationResult {
        guard let mobile = mobile?.trimmingCharacters(in: .whitespacesAndNewlines), !mobile.isEmpty else {
            return .failure("Mobile number cannot be empty")
        }

        let regex = "^[0-9]{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        
        if predicate.evaluate(with: mobile) {
            return .success
        } else {
            return .failure("Invalid mobile number format. It should be exactly 10 digits.")
        }
    }
}

public enum ValidationResult {
    case success
    case failure(String)
}
