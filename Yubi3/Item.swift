//
//  Item.swift
//  Yubi3
//
//  Created by Joe Blau on 9/20/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
