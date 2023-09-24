//
//  Status.swift
//  Yubi3
//
//  Created by Joe Blau on 9/20/23.
//

import Foundation

enum Status: CustomStringConvertible {
    case disconnected
    case connected
    
    var description: String {
        switch self {
        case .disconnected: "Disconnected"
        case .connected: "Connected"
        }
    }
}
