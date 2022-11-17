//
//  URLRequest+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension URLRequest {
    
    /// Add basic authentication for the current request.
    ///
    /// - Parameters:
    ///   - username: Username
    ///   - password: Password
    /// - Returns: Current request with basic authentication added in HTTP header
    public mutating func addBasicAuthentication(
        username: String,
        password: String
    ) {
        let basicAuthString = "\(username):\(password)"
        guard let basicAuthData = basicAuthString.data(using: .utf8) else {
            return
        }
        let base64AuthCredentials = basicAuthData.base64EncodedString(options: .lineLength64Characters)
        setValue("Basic \(base64AuthCredentials)", forHTTPHeaderField: "Authorization")
    }
}
