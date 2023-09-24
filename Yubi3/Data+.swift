//
//  Data+.swift
//  Yubi3
//
//  Created by Joe Blau on 9/20/23.
//

import Foundation

extension Data {
    var hexDescription: String {
        return reduce("") {$0 + String(format: "%02x", $1)}
    }
}
