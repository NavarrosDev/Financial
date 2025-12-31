//
//  String+Extensions.swift
//  Financial
//
//  Created by Gabriel Navarro on 30/12/25.
//

import Foundation

extension String {
    
    func sanitizedNumeric() -> String {
        let filtered = self
            .replacingOccurrences(of: ",", with: ".")
            .filter { "0123456789.".contains($0) }
            
        if let firstDotIndex = filtered.firstIndex(of: ".") {
            let prefix = filtered[...firstDotIndex]
            let suffix = filtered[filtered.index(after: firstDotIndex)...]
            return String(prefix) + suffix.replacingOccurrences(of: ".", with: "")
        }
        
        return filtered
    }

}
