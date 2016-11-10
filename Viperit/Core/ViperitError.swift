//
//  ViperitError.swift
//  Viperit
//
//  Created by Ferran on 29/10/2016.
//  Copyright © 2016 Ferran Abelló. All rights reserved.
//

import Foundation

internal enum ViperitError : Error {
    case methodNotImplemented
    
    var description: String {
        var message = ""
        switch self {
            case .methodNotImplemented: message = "Method not implemented"
        }
        return "[VIPERIT WARNING]: \(message)"
    }
}
