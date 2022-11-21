//
//  URL+Extensions.swift
//  
//
//  Created by Andrea Busi (www.andreabusi.it).
//

import Foundation


extension URL {
    
    /// Add query string parameters to the current URL.
    /// - Returns: A new URL instance with given value added as query string parameter.
    public func appending(_ queryItem: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
    
    /// Get the value of a query string parameter (if exists).
    /// - Returns: The value associated to the given query string parameter, nil if not available.
    public func queryParameterValue(for queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
